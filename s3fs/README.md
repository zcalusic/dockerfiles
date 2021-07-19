# Run s3fs FUSE-based file system backed by Amazon S3 in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/s3fs.svg)](https://hub.docker.com/r/zcalusic/s3fs/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/s3fs.svg)](https://hub.docker.com/r/zcalusic/s3fs/)

This Docker container makes it easy to mount an S3 bucket via FUSE.  Learn more about s3fs: <https://github.com/s3fs-fuse/s3fs-fuse>

## Pull image

```
sudo docker pull zcalusic/s3fs
```

## Running container

```
sudo docker run -d \
     --privileged \
     -e AWSACCESSKEYID=username \
     -e AWSSECRETACCESSKEY=password \
     --name s3fs \
     zcalusic/s3fs \
     s3fs bucket /mnt -f -o url=http://minio:9000/ -o use_path_request_style
```

## Building container image

```
sudo make docker_build
```
