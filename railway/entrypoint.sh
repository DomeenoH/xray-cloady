#!/bin/sh
set -e
# Railway 会注入 $PORT；没注入就用 3000
PORT="${PORT:-3000}"
# UUID 由 Railway 服务变量注入，不写进仓库
if [ -z "$UUID" ]; then echo "UUID env var is not set" >&2; exit 1; fi
sed -i "s/\"port\": *3000/\"port\": ${PORT}/; s/UUID_PLACEHOLDER/${UUID}/" /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
