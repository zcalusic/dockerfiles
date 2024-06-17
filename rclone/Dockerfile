FROM golang as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG RCLONE_VERSION

RUN cd src \
    && git clone --branch "$RCLONE_VERSION" --depth 1 https://github.com/rclone/rclone \
    && cd rclone \
    && rm backend/local/fadvise_unix.go \
    && sed -i -e '1d;2d' backend/local/fadvise_other.go \
    && go install -trimpath -ldflags "-s -X github.com/rclone/rclone/fs.Version=$RCLONE_VERSION"

FROM zcalusic/debian-bookworm
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

CMD [ "rclone" ]
