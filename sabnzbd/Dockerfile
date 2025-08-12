FROM zcalusic/debian-trixie

ARG SABNZBD_VERSION

ENV SABNZBD_VERSION=$SABNZBD_VERSION

ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV PIP_ROOT_USER_ACTION=ignore

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       p7zip-full \
       par2 \
       python3-pip \
       unrar \
       unzip \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/sabnzbd \
    && wget --dot-style=mega -O- "https://github.com/sabnzbd/sabnzbd/releases/download/$SABNZBD_VERSION/SABnzbd-$SABNZBD_VERSION-src.tar.gz" | tar xz --strip-components=1 -C /opt/sabnzbd \
    && pip install --no-cache-dir -r /opt/sabnzbd/requirements.txt -U

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
