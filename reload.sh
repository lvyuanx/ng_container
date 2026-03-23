#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
ENV_OPT=()
if [ -f ./.env ]; then
  ENV_OPT=(--env-file .env)
fi

docker compose "${ENV_OPT[@]}" exec nginx nginx -s reload
