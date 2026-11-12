# xray on Railway

VLESS + WebSocket + TLS, deployed on Railway via Dockerfile.
Root directory for the Railway service: `railway/`.

- WS path: `/tk-rail`
- Container listens on Railway's injected `$PORT`
- Client UUID comes from the Railway service variable `UUID` (not stored in this repo)
