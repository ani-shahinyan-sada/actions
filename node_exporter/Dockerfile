FROM alpine AS builder
RUN apk add --no-cache wget tar
RUN adduser -D -s /bin/sh node_exporter

ARG arch=amd64

ADD https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-${arch}.tar.gz .
RUN tar -xzf node_exporter-1.9.1.linux-${arch}.tar.gz

FROM builder

RUN mv node_exporter-1.9.1.linux-${arch}/node_exporter /usr/local/bin/ && rm -rf node_exporter-1.9.1.linux-${arch}* && chown node_exporter:node_exporter /usr/local/bin/node_exporter

USER node_exporter
EXPOSE 9100
ENTRYPOINT ["/usr/local/bin/node_exporter"]