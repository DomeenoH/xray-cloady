# 多阶段：官方 xray 镜像没有 shell，把二进制拷进 Alpine
FROM ghcr.io/xtls/xray-core:latest AS xray

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=xray /usr/local/bin/xray /usr/local/bin/xray
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
CMD ["/entrypoint.sh"]
