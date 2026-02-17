FROM zcalusic/debian-trixie

ARG CHIA_VERSION

ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV PIP_ROOT_USER_ACTION=ignore

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       git \
       python-is-python3 \
       python3-dev \
       python3-pip \
    && cd /usr/local \
    && git clone --branch "$CHIA_VERSION" --depth 1 https://github.com/Chia-Network/chia-blockchain.git \
    && cd chia-blockchain \
    && pip install --no-cache-dir "chia-blockchain==$CHIA_VERSION" \
    && apt-get purge -y --autoremove \
       build-essential \
       git \
       python3-dev \
    && rm -rf /var/lib/apt/lists/* /root/.cache

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "dumb-init" ]

CMD [ "/entrypoint.sh" ]
