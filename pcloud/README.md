# Run pCloud storage client in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/pcloud.svg)](https://hub.docker.com/r/zcalusic/pcloud/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/pcloud.svg)](https://hub.docker.com/r/zcalusic/pcloud/)

This Docker container makes it easy to mount your pCloud storage.  Learn more about pCloud: <https://www.pcloud.com/>

## Pull image

```
sudo docker pull zcalusic/pcloud
```

## Linking to pCloud account on first start

You need to mount host directory that will persist pCloud cache files in `pcloud-cache-dir`, and pCloud storage data will be available inside container in `pcloud-mount-dir`.  Adapt these paths to your environment before the initial run:

```
sudo docker run -it \
     --privileged \
     -v pcloud-cache-dir:/root/.pcloud \
     --name pcloud \
     zcalusic/pcloud \
     pcloudcc -u username@example.com -s -m pcloud-mount-dir
```

Enter password when prompted:

```
pCloud console client v.2.0.1
Down: Everything Downloaded| Up: Everything Uploaded, status is LOGIN_REQUIRED
Please, enter password
```

Wait for the initial sync to complete, indicated by:

```
Down: Everything Downloaded| Up: Everything Uploaded, status is READY
```

## Running container

```
sudo docker run -d \
     --privileged \
     -v pcloud-cache-dir:/root/.pcloud \
     --name pcloud \
     zcalusic/pcloud \
     pcloudcc -u username@example.com
```


## Building container image

```
sudo make docker_build
```
