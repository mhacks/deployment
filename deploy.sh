#!/bin/bash
set -euo pipefail

# Usage check
if [[ $# -ne 1 ]] || [[ "$1" != "up" && "$1" != "down" ]]; then
    echo "Usage: $0 [up|down]"
    exit 1
fi

ACTION=$1

# Run docker compose
compose_files=$(find docker -type f -name "*.yml" | sort | sed 's/^/-f /')

echo "Running 'docker compose $ACTION' with files:"
echo "$compose_files"

if [[ "$ACTION" == "up" ]]; then
    docker compose $compose_files up -d --pull always
else
    docker compose $compose_files down
fi
