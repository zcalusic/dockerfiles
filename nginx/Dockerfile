FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV NGINX_VERSION 1.15.8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       git \
       libc6-dev \
       libgd-dev \
       libgeoip-dev \
       libpcre3-dev \
       libssl-dev \
       libxslt1-dev \
       make \
    && cd /usr/src \
    && wget -O- "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" | tar xzo \
    && git clone https://github.com/GUI/nginx-upstream-dynamic-servers \
    && cd "/usr/src/nginx-${NGINX_VERSION}" \
    && ./configure \
       --prefix=/etc/nginx \
       --sbin-path=/usr/sbin/nginx \
       --modules-path=/usr/lib/nginx/modules \
       --conf-path=/etc/nginx/nginx.conf \
       --error-log-path=/dev/stderr \
       --http-log-path=/dev/stdout \
       --pid-path=/run/nginx.pid \
       --lock-path=/run/nginx.lock \
       --http-client-body-temp-path=/var/cache/nginx/client_temp \
       --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
       --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
       --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
       --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
       --user=www-data \
       --group=www-data \
       --with-compat \
       --with-file-aio \
       --with-threads \
       --with-http_addition_module \
       --with-http_auth_request_module \
       --with-http_dav_module \
       --with-http_degradation_module \
       --with-http_flv_module \
       --with-http_geoip_module \
       --with-http_gunzip_module \
       --with-http_gzip_static_module \
       --with-http_image_filter_module \
       --with-http_mp4_module \
       --with-http_random_index_module \
       --with-http_realip_module \
       --with-http_secure_link_module \
       --with-http_slice_module \
       --with-http_ssl_module \
       --with-http_stub_status_module \
       --with-http_sub_module \
       --with-http_v2_module \
       --with-http_xslt_module \
       --with-mail \
       --with-mail_ssl_module \
       --with-stream \
       --with-stream_geoip_module \
       --with-stream_realip_module \
       --with-stream_ssl_module \
       --with-stream_ssl_preread_module \
       --with-cc-opt='-O2 -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' \
       --with-ld-opt='-s -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie' \
       --add-module=/usr/src/nginx-upstream-dynamic-servers \
    && make -j "$(nproc)" install

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

COPY --from=builder /usr/sbin/nginx /usr/sbin/nginx
COPY --from=builder /etc/nginx /etc/nginx.default

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       geoip-database \
       geoip-database-extra \
       libgd3 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/cache/nginx

EXPOSE 80 443

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
