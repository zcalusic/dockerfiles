// Copyright © 2017 Zlatko Čalušić
//
// Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.

package main

import (
	"fmt"
	"log"
	"os"
	"os/user"
	"path"
	"strconv"

	docker "github.com/fsouza/go-dockerclient"
)

const (
	endpoint  = "unix:///var/run/docker.sock"
	imageName = "zcalusic/dropbox"
)

var (
	client *docker.Client
)

func main() {
	log.SetFlags(0)

	hostname, err := os.Hostname()
	if err != nil {
		log.Fatal(err)
	}

	current, err := user.Current()
	if err != nil {
		log.Fatal(err)
	}

	name := "dropbox_" + current.Username

	homeDir := os.Getenv("HOME")
	if homeDir == "" {
		homeDir = current.HomeDir
	}

	uid, err := strconv.Atoi(current.Uid)
	if err != nil {
		log.Fatal(err)
	}

	gid, err := strconv.Atoi(current.Gid)
	if err != nil {
		log.Fatal(err)
	}

	dropboxConfPath := path.Join(homeDir, ".dropbox")
	os.MkdirAll(dropboxConfPath, 0755)
	os.Chown(dropboxConfPath, uid, gid)

	dropboxSyncPath := path.Join(homeDir, "Dropbox")
	os.MkdirAll(dropboxSyncPath, 0755)
	os.Chown(dropboxSyncPath, uid, gid)

	client, err = docker.NewClient(endpoint)
	if err != nil {
		log.Fatal(err)
	}

	env := docker.Env{
		"HOME=" + homeDir,
	}

	config := &docker.Config{
		Image:    imageName,
		Hostname: hostname,
		User:     current.Uid + ":" + current.Gid,
		Env:      env,
	}

	binds := []string{
		dropboxConfPath + ":" + dropboxConfPath,
		dropboxSyncPath + ":" + dropboxSyncPath,
	}

	hostconfig := &docker.HostConfig{
		NetworkMode: "host",
		Binds:       binds,
	}

	options := docker.CreateContainerOptions{
		Name:       name,
		Config:     config,
		HostConfig: hostconfig,
	}

	if len(os.Args) == 1 {
		os.Args = append(os.Args, "help")
	}

	if os.Args[1] == "start" {
		if _, err = client.CreateContainer(options); err != nil && err != docker.ErrContainerAlreadyExists {
			log.Fatal(err)
		}

		if err = client.StartContainer(name, hostconfig); err != nil {
			if _, ok := err.(*docker.ContainerAlreadyRunning); !ok {
				log.Fatal(err)
			}
		} else {
			return
		}
	}

	execOptions := docker.CreateExecOptions{
		Container:    name,
		Cmd:          os.Args,
		User:         current.Uid + ":" + current.Gid,
		AttachStdin:  true,
		AttachStdout: true,
		AttachStderr: true,
	}

	exec, err := client.CreateExec(execOptions)
	switch os.Args[1] {
	case "running":
		if err != nil {
			os.Exit(0)
		} else {
			os.Exit(1)
		}
	case "help":
		if err != nil {
			fmt.Print(`Dropbox command-line interface

commands:

Note: use dropbox help <command> to view usage for a specific command.

 status       get current status of the dropboxd
 throttle     set bandwidth limits for Dropbox
 help         provide help
 puburl       get public url of a file in your dropbox's public folder
 stop         stop dropboxd
 running      return whether dropbox is running
 start        start dropboxd
 filestatus   get current sync status of one or more files
 ls           list directory contents with current sync status
 autostart    automatically start dropbox at login
 exclude      ignores/excludes a directory from syncing
 lansync      enables or disables LAN sync
 sharelink    get a shared link for a file in your dropbox
 proxy        set proxy settings for Dropbox

`)
			os.Exit(0)
		}
	default:
		if err != nil {
			fmt.Println("Dropbox isn't running!")
			os.Exit(0)
		}
	}

	startExecOptions := docker.StartExecOptions{
		InputStream:  os.Stdin,
		OutputStream: os.Stdout,
		ErrorStream:  os.Stderr,
	}

	if err = client.StartExec(exec.ID, startExecOptions); err != nil {
		log.Fatal(err)
	}
}
