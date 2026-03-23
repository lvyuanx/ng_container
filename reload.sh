#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
ENV_OPT=()
if [ -f ./.env ]; then
  ENV_OPT=(--env-file .env)
  set -a; . ./.env; set +a
fi

COMPOSE_FILES=(-f docker-compose.yaml)
if [ -n "${EXTRA_PORTS:-}" ]; then
  COMPOSE_FILES+=(-f docker-compose.extra-ports.yaml)
fi

docker compose "${COMPOSE_FILES[@]}" "${ENV_OPT[@]}" exec nginx nginx -s reload
