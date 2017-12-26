
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       man \
    && rm -rf /var/lib/apt/lists/* \
    && mv /etc/mfs /etc/mfs.default

EXPOSE 9422

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
