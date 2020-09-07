FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG SABNZBD_VERSION

ENV SABNZBD_VERSION $SABNZBD_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       p7zip-full \
       par2 \
       python3-chardet \
       python3-cheetah \
       python3-cherrypy3 \
       python3-configobj \
       python3-cryptography \
       python3-feedparser \
       python3-portend \
       python3-sabyenc \
       unrar \
       unzip \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /opt/sabnzbd \
    && wget --dot-style=mega -O- "https://github.com/sabnzbd/sabnzbd/releases/download/${SABNZBD_VERSION}/SABnzbd-${SABNZBD_VERSION}-src.tar.gz" | tar xz --strip-components=1 -C /opt/sabnzbd

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
