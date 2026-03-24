FROM golang AS builder

ARG RCLONE_VERSION

RUN go install -trimpath -ldflags "-s -X github.com/rclone/rclone/fs.Version=$RCLONE_VERSION" "github.com/rclone/rclone@$RCLONE_VERSION"

FROM zcalusic/debian-trixie

COPY --from=builder /go/bin /usr/bin

CMD [ "rclone" ]
