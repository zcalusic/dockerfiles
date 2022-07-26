FROM kadena/chainweb-node
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends dumb-init \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "dumb-init" ]

CMD [ "/chainweb/run-chainweb-node.sh" ]
