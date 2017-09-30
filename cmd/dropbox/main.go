// Copyright © 2017 Zlatko Čalušić
//
// Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.

package main

import (
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

	if _, err = client.CreateContainer(options); err != nil && err != docker.ErrContainerAlreadyExists {
		log.Fatal(err)
	}

	if err = client.StartContainer(name, hostconfig); err != nil {
		if err, ok := err.(*docker.ContainerAlreadyRunning); !ok {
			log.Fatal(err)
		}
	}
}
