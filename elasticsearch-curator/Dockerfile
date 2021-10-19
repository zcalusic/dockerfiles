FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends elasticsearch-curator \
    && rm -rf /var/lib/apt/lists/*

CMD [ "curator" ]
