FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends rsync \
    && rm -rf /var/lib/apt/lists/*

CMD [ "rsync" ]
