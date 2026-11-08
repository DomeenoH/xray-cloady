# Stage 1 - official xray image (distroless, no shell): only take the binary
FROM ghcr.io/xtls/xray-core:latest AS xray

# Stage 2 - Alpine runtime: write config.json in Alpine and run xray
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=xray /usr/local/bin/xray /usr/local/bin/xray
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
CMD ["/entrypoint.sh"]
