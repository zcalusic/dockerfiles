FROM zcalusic/debian-trixie AS builder

ARG BITCOIN_VERSION

ENV BITCOIN_VERSION=$BITCOIN_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       cmake \
       doxygen \
       git \
       graphviz \
       libboost-dev \
       libevent-dev \
       libsqlite3-dev \
       libzmq3-dev \
       pkgconf \
       python-is-python3 \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && cd /usr/src \
    && git clone --branch "$BITCOIN_VERSION" --depth 1 https://github.com/bitcoin/bitcoin \
    && cd bitcoin \
    && cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_IPC=OFF -DBUILD_TESTS=OFF -DWITH_ZMQ=ON -DBUILD_TX=ON -DBUILD_UTIL=ON -DBUILD_WALLET_TOOL=ON \
    && cmake --build build --target install/strip \
    && gzip -9 /usr/share/man/man1/bitcoin*

FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libevent-2.1-7 \
       libevent-extra-2.1-7 \
       libevent-pthreads-2.1-7 \
       libsqlite3-0 \
       libzmq5 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/bin/bitcoin* /usr/bin
COPY --from=builder /usr/share/man/man1/bitcoin* /usr/share/man/man1
COPY --from=builder /usr/src/bitcoin/share/examples/bitcoin.conf /etc/bitcoin.conf

EXPOSE 8332 8333

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
