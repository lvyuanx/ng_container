#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

ENV_OPTS=()
if [ -f ./.env ]; then
  ENV_OPTS=(--env-file .env)
  set -a; . ./.env; set +a
fi

COMPOSE_FILES=(-f docker-compose.yaml)
if [ -n "${EXTRA_PORTS:-}" ]; then
  COMPOSE_FILES+=(-f docker-compose.extra-ports.yaml)
fi

docker compose "${COMPOSE_FILES[@]}" "${ENV_OPTS[@]}" up -d
