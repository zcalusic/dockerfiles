FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends openvpn \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/openvpn

CMD [ "openvpn" ]
