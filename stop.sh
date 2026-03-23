#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

COMPOSE_FILES=(-f docker-compose.yaml)
if [ -f docker-compose.extra-ports.yaml ]; then
  COMPOSE_FILES+=(-f docker-compose.extra-ports.yaml)
fi

docker compose "${COMPOSE_FILES[@]}" down
