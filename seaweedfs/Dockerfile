FROM golang:bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG SEAWEEDFS_VERSION

RUN go install "github.com/seaweedfs/seaweedfs/weed@$SEAWEEDFS_VERSION"

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

CMD [ "weed" ]
