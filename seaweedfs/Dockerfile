FROM golang AS builder

ARG SEAWEEDFS_VERSION

RUN go install -trimpath -ldflags="-s" "github.com/seaweedfs/seaweedfs/weed@$SEAWEEDFS_VERSION"

FROM zcalusic/debian-bookworm

COPY --from=builder /go/bin /usr/bin

CMD [ "weed" ]
