FROM debian:bullseye

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    libcurl3-gnutls \
    libgcrypt20 \
    libriemann-client0 \
    libudev1 \
    default-jre \
    collectd \
    libmicrohttpd12 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY ./collectd.conf /etc/collectd/collectd.conf

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["collectd -f"]
