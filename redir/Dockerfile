FROM zcalusic/debian-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       redir \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "dumb-init" ]

CMD [ "/entrypoint.sh" ]
