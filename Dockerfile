FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV NGINX_VERSION 1.12.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libpcre3-dev \
       libssl-dev \
       zlib1g-dev \
    && wget -O- "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" | tar xzo -C /usr/src \
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
       --http-client-body-temp-path=/dev/shm/nginx/client_temp \
       --http-proxy-temp-path=/dev/shm/nginx/proxy_temp \
       --http-fastcgi-temp-path=/dev/shm/nginx/fastcgi_temp \
       --http-uwsgi-temp-path=/dev/shm/nginx/uwsgi_temp \
       --http-scgi-temp-path=/dev/shm/nginx/scgi_temp \
       --user=www-data \
       --group=www-data \
       --with-compat \
       --with-file-aio \
       --with-threads \
       --with-http_addition_module \
       --with-http_auth_request_module \
       --with-http_dav_module \
       --with-http_flv_module \
       --with-http_gunzip_module \
       --with-http_gzip_static_module \
       --with-http_mp4_module \
       --with-http_random_index_module \
       --with-http_realip_module \
       --with-http_secure_link_module \
       --with-http_slice_module \
       --with-http_ssl_module \
       --with-http_stub_status_module \
       --with-http_sub_module \
       --with-http_v2_module \
       --with-mail \
       --with-mail_ssl_module \
       --with-stream \
       --with-stream_realip_module \
       --with-stream_ssl_module \
       --with-stream_ssl_preread_module \
       --with-cc-opt='-O2 -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' \
       --with-ld-opt='-s -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie' \
    && make -j8 install

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

EXPOSE 80

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
