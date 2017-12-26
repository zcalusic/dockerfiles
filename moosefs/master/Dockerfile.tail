
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       man \
    && rm -rf /var/lib/apt/lists/* \
    && mv /etc/mfs /etc/mfs.default \
    && mv /var/lib/mfs /var/lib/mfs.default

EXPOSE 9419 9420 9421

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
