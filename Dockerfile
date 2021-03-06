FROM camptocamp/collectd:v0.2.3

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    libcurl3-gnutls \
    libgcrypt20 \
    libriemann-client0 \
    libudev1 \
    openjdk-8-jre-headless \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
ADD ./confd.run /etc/service/confd/run
ADD ./collectd.run /etc/service/collectd/run

RUN ln -sf /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/libjvm.so /usr/lib

