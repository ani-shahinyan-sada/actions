FROM alpine AS builder

RUN apk add --no-cache wget tar
RUN adduser -D -s /bin/sh prometheus

ARG arch=amd64

ADD https://github.com/prometheus/prometheus/releases/download/v3.6.0-rc.1/prometheus-3.6.0-rc.1.linux-${arch}.tar.gz .
RUN tar -xzf prometheus-3.6.0-rc.1.linux-${arch}.tar.gz

FROM builder
RUN mv prometheus-3.6.0-rc.1.linux-${arch}/prometheus /usr/local/bin/ && \
    mv prometheus-3.6.0-rc.1.linux-${arch}/promtool /usr/local/bin/ && \
    rm -rf prometheus-3.6.0-rc.1.linux-${arch}* && \
    mkdir -p /etc/prometheus && \
    mkdir -p /prometheus && \
    chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool /etc/prometheus /prometheus

USER prometheus
EXPOSE 9090

ENTRYPOINT ["/usr/local/bin/prometheus"]
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus"]