FROM golang as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG SEAWEEDFS_VERSION

RUN go install -trimpath -ldflags="-s" "github.com/seaweedfs/seaweedfs/weed@$SEAWEEDFS_VERSION"

FROM zcalusic/debian-bookworm
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

CMD [ "weed" ]
