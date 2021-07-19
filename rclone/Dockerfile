FROM golang:buster as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG RCLONE_VERSION

ENV CGO_ENABLED 0

RUN go install --ldflags "-s -X github.com/rclone/rclone/fs.Version=$RCLONE_VERSION" "github.com/rclone/rclone@$RCLONE_VERSION"

FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

CMD [ "rclone" ]
