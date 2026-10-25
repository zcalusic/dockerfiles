FROM zcalusic/debian-trixie AS builder

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       g++ \
       git \
       make \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && cd /usr/local/src \
    && PAR2CMDLINE_TURBO_LATEST_RELEASE=$(wget -q --server-response -O /dev/null https://github.com/animetosho/par2cmdline-turbo/releases/latest 2>&1 | sed -n 's|^ *Location: .*/releases/tag/||p') \
    && git clone --branch "$PAR2CMDLINE_TURBO_LATEST_RELEASE" --depth 1 https://github.com/animetosho/par2cmdline-turbo \
    && cd par2cmdline-turbo \
    && autoreconf -fvi \
    && ./configure --prefix=/usr \
    && make install-strip

FROM zcalusic/debian-trixie

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

ARG SABNZBD_VERSION

ENV SABNZBD_VERSION=$SABNZBD_VERSION

ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV PIP_ROOT_USER_ACTION=ignore

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       p7zip-full \
       python3-pip \
       unrar \
       unzip \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/sabnzbd \
    && wget --dot-style=mega -O- "https://github.com/sabnzbd/sabnzbd/releases/download/$SABNZBD_VERSION/SABnzbd-$SABNZBD_VERSION-src.tar.gz" | tar xz --strip-components=1 -C /opt/sabnzbd \
    && pip install --no-cache-dir -r /opt/sabnzbd/requirements.txt -U

COPY --from=builder /usr/bin/par2 /usr/bin/par2

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
