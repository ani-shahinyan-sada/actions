FROM alpine AS builder
RUN apk --no-cache add wget ca-certificates
ADD https://dl.grafana.com/oss/release/grafana-11.3.0.linux-amd64.tar.gz .
RUN tar -xzf grafana-11.3.0.linux-amd64.tar.gz && \
    mv grafana-v11.3.0 grafana && \
    rm grafana-11.3.0.linux-amd64.tar.gz

FROM alpine:latest
RUN apk --no-cache add ca-certificates libc6-compat

RUN adduser -D -u 472 grafana
COPY --from=builder --chown=grafana:grafana /grafana /usr/share/grafana

USER grafana
WORKDIR /usr/share/grafana
EXPOSE 3000
ENTRYPOINT ["./bin/grafana", "server", "--homepath=/usr/share/grafana"]