FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 icinga nagios-plugins nagios-nrpe-plugin curl ca-certificates python && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN FOREGO_URL="https://github.com/viranch/forego/releases/download/20211019/forego-linux-amd64.tgz"; \
    curl -L $FOREGO_URL | tar -C /usr/local/bin/ -zx
COPY Procfile /opt/forego/

COPY entrypoint.sh /opt/

VOLUME ["/etc/icinga", "/var/cache/icinga", "/var/log/icinga"]

EXPOSE 80

ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["forego", "start", "-f", "/opt/forego/Procfile", "-r"]
