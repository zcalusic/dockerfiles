FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Syncthing in Docker" \
      org.label-schema.description="Run Syncthing continuous file synchronization in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV STNOUPGRADE true
ENV STNODEFAULTFOLDER true

RUN SYNCTHING_VERSION="$(wget -qO- https://api.github.com/repos/syncthing/syncthing/releases/latest | jq -r '.tag_name')" \
    && SYNCTHING_TARBALL="syncthing-linux-amd64-${SYNCTHING_VERSION}.tar.gz" \
    && SYNCTHING_DIRECTORY="$(basename $SYNCTHING_TARBALL .tar.gz)" \
    && SYNCTHING_SHA256SUM="sha256sum.txt.asc" \
    && wget --dot-style=mega "https://github.com/syncthing/syncthing/releases/download/${SYNCTHING_VERSION}/${SYNCTHING_TARBALL}" \
    && wget "https://github.com/syncthing/syncthing/releases/download/${SYNCTHING_VERSION}/${SYNCTHING_SHA256SUM}" \
    && gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 37C84554E7E0A261E4F76E1ED26E6ED000654A3E \
    && gpg --verify "${SYNCTHING_SHA256SUM}" \
    && egrep "  ${SYNCTHING_TARBALL}$" "${SYNCTHING_SHA256SUM}" | sha256sum -c \
    && tar xzof "${SYNCTHING_TARBALL}" --strip-components=1 -C /usr/bin "${SYNCTHING_DIRECTORY}/syncthing" \
    && rm -rf "${SYNCTHING_TARBALL}" "${SYNCTHING_SHA256SUM}"

EXPOSE 8384 22000 21027/udp

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
