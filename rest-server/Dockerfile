FROM golang as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

RUN go install -trimpath -ldflags="-s" "github.com/zcalusic/rest-server/cmd/rest-server@$REST_SERVER_VERSION"

FROM zcalusic/debian-bookworm
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

COPY --from=builder /go/bin /usr/bin

EXPOSE 8000

CMD [ "rest-server" ]
