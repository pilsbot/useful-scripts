#!/bin/bash
set -x

[ -z "$1" ] && CONTAINER=$(docker ps --format '{{.Names}}' | head -n1) || CONTAINER=$1

docker exec -u ros -w /workspaces/pilsbot_vscode_ws -it $CONTAINER bash
