// Copyright © 2017 Zlatko Čalušić
//
// Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.

package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"os/user"
	"path"
	"strconv"
	"strings"

	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
	"github.com/docker/docker/pkg/stdcopy"
	"github.com/docker/go-connections/nat"
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

	cli, err := client.NewClient("unix:///var/run/docker.sock", "", nil, nil)
	if err != nil {
		log.Fatal(err)
	}

	env := []string{
		"HOME=" + homeDir,
	}

	config := &container.Config{
		Image:    "zcalusic/dropbox",
		Hostname: hostname,
		User:     current.Uid + ":" + current.Gid,
		Env:      env,
	}

	binds := []string{
		dropboxConfPath + ":" + dropboxConfPath,
		dropboxSyncPath + ":" + dropboxSyncPath,
	}

	portMap := nat.PortMap{
		"17500/tcp": []nat.PortBinding{
			{
				HostIP:   "0.0.0.0",
				HostPort: "17500",
			},
		},
	}

	hostConfig := &container.HostConfig{
		Binds:        binds,
		PortBindings: portMap,
	}

	ctx := context.Background()
	name := "dropbox_" + current.Username

	if len(os.Args) == 1 {
		os.Args = append(os.Args, "help")
	}

	if os.Args[1] == "start" {
		resp, err := cli.ContainerCreate(ctx, config, hostConfig, nil, name)
		if err != nil {
			if strings.Contains(err.Error(), "is already in use by container") {
				if err = cli.ContainerRemove(ctx, name, types.ContainerRemoveOptions{}); err != nil {
					if strings.Contains(err.Error(), "You cannot remove a running container") {
						goto exec
					} else {
						log.Fatal(err)
					}
				}

				resp, err = cli.ContainerCreate(ctx, config, hostConfig, nil, name)
				if err != nil {
					log.Fatal(err)
				}
			} else {
				log.Fatal(err)
			}
		}

		if err = cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
			log.Fatal(err)
		} else {
			return
		}
	}

exec:
	execConfig := types.ExecConfig{
		User:         current.Uid + ":" + current.Gid,
		AttachStdout: true,
		AttachStderr: true,
		Cmd:          os.Args,
	}

	resp, err := cli.ContainerExecCreate(ctx, name, execConfig)
	if err != nil {
		switch os.Args[1] {
		case "running":
		case "help":
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
		default:
			fmt.Println("Dropbox isn't running!")
		}
		os.Exit(0)
	}

	att, err := cli.ContainerExecAttach(ctx, resp.ID, execConfig)
	if err != nil {
		log.Fatal(err)
	}

	if _, err = stdcopy.StdCopy(os.Stdout, os.Stderr, att.Reader); err != nil {
		log.Fatal(err)
	}

	att.Close()

	insp, err := cli.ContainerExecInspect(ctx, resp.ID)
	if err != nil {
		log.Fatal(err)
	}

	os.Exit(insp.ExitCode)
}
