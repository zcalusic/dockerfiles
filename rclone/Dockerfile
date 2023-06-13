FROM golang as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG RCLONE_VERSION

RUN go install -trimpath -ldflags "-s -X github.com/rclone/rclone/fs.Version=$RCLONE_VERSION" "github.com/rclone/rclone@$RCLONE_VERSION"

FROM zcalusic/debian-bookworm
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

CMD [ "rclone" ]
