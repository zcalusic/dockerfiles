FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends openconnect \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/openconnect

CMD [ "openconnect" ]
