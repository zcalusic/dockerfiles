FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG CHIA_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
       python-is-python3 \
       python3-pip \
    && cd /usr/local \
    && git clone --branch "$CHIA_VERSION" --depth 1 https://github.com/Chia-Network/chia-blockchain.git \
    && cd chia-blockchain \
    && git submodule update --init --depth 1 mozilla-ca \
    && pip install -e . --extra-index-url https://pypi.chia.net/simple/ \
    && apt-get purge -y --autoremove git \
    && rm -rf /var/lib/apt/lists/* /root/.cache

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "dumb-init" ]

CMD [ "/entrypoint.sh" ]
