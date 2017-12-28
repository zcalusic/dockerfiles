
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       fcgiwrap \
       nginx-light \
       python \
    && rm -rf /var/lib/apt/lists/*

COPY default /etc/nginx/sites-available/default

EXPOSE 9425

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
