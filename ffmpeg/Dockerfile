FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ffmpeg \
       mediainfo \
       mkvtoolnix \
       tmux \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "dumb-init" ]

CMD [ "sleep", "infinity" ]
