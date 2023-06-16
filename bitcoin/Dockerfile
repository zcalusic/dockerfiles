FROM zcalusic/debian-bookworm as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG BITCOIN_VERSION

ENV BITCOIN_VERSION $BITCOIN_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       build-essential \
       file \
       git \
       libboost-filesystem-dev \
       libboost-thread-dev \
       libevent-dev \
       libsqlite3-dev \
       libtool \
       libzmq3-dev \
       pkgconf \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && cd /usr/src \
    && git clone --depth 1 https://github.com/zcalusic/db-4.8.30.NC \
    && cd db-4.8.30.NC/build_unix \
    && ../dist/configure --enable-cxx --disable-shared --disable-replication --with-pic \
    && make \
    && BDB_LIBS="-L$(pwd) -ldb_cxx-4.8" \
    && export BDB_LIBS \
    && BDB_CFLAGS="-I$(pwd)" \
    && export BDB_CFLAGS \
    && cd /usr/src \
    && git clone --branch "$BITCOIN_VERSION" --depth 1 https://github.com/bitcoin/bitcoin \
    && cd bitcoin \
    && ./autogen.sh \
    && ./configure --prefix=/usr --disable-tests --disable-bench --without-gui --without-miniupnpc --without-natpmp \
    && make install-strip \
    && gzip -9 /usr/share/man/man1/bitcoin-cli.1 /usr/share/man/man1/bitcoin-tx.1 /usr/share/man/man1/bitcoin-wallet.1 /usr/share/man/man1/bitcoind.1

FROM zcalusic/debian-bookworm
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libboost-filesystem1.74.0 \
       libboost-thread1.74.0 \
       libevent-2.1-7 \
       libevent-pthreads-2.1-7 \
       libsqlite3-0 \
       libzmq5 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/bin/bitcoin-cli /usr/bin/bitcoin-cli
COPY --from=builder /usr/bin/bitcoin-tx /usr/bin/bitcoin-tx
COPY --from=builder /usr/bin/bitcoin-wallet /usr/bin/bitcoin-wallet
COPY --from=builder /usr/bin/bitcoind /usr/bin/bitcoind
COPY --from=builder /usr/share/man/man1/bitcoin-cli.1.gz /usr/share/man/man1/bitcoin-cli.1.gz
COPY --from=builder /usr/share/man/man1/bitcoin-tx.1.gz /usr/share/man/man1/bitcoin-tx.1.gz
COPY --from=builder /usr/share/man/man1/bitcoin-wallet.1.gz /usr/share/man/man1/bitcoin-wallet.1.gz
COPY --from=builder /usr/share/man/man1/bitcoind.1.gz /usr/share/man/man1/bitcoind.1.gz
COPY --from=builder /usr/src/bitcoin/share/examples/bitcoin.conf /etc/bitcoin.conf

EXPOSE 8332 8333

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
