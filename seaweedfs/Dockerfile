FROM golang AS builder

ARG SEAWEEDFS_VERSION

RUN git clone --branch "$SEAWEEDFS_VERSION" --depth 1 https://github.com/seaweedfs/seaweedfs /usr/src/seaweedfs \
    && cd /usr/src/seaweedfs/weed \
    && go build -trimpath -ldflags "-s -X github.com/seaweedfs/seaweedfs/weed/util/version.COMMIT=$(git rev-parse --short HEAD)" -o /go/bin/weed .

FROM zcalusic/debian-trixie

COPY --from=builder /go/bin /usr/bin

CMD [ "weed" ]
