FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="NGINX in Docker" \
      org.label-schema.description="Run NGINX high-performance HTTP server and reverse proxy in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-key adv --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && echo "deb https://nginx.org/packages/debian stretch nginx" > /etc/apt/sources.list.d/nginx.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       geoip-database-contrib \
       nginx \
       nginx-module-geoip \
       nginx-module-image-filter \
       nginx-module-njs \
       nginx-module-xslt \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
