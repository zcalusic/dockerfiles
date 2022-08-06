FROM golang:bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG DCRD_VERSION

RUN go install -trimpath -ldflags="-s" \
      "github.com/decred/dcrd@$DCRD_VERSION" \
      "github.com/decred/dcrd/cmd/gencerts@$DCRD_VERSION" \
      "github.com/decred/dcrd/cmd/promptsecret@$DCRD_VERSION" \
    && go install -trimpath -ldflags="-s" "decred.org/dcrctl@$DCRD_VERSION"

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

EXPOSE 9108 9109

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
