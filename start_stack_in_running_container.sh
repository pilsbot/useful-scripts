#!/bin/bash
set -x

[ -z "$1" ] && CONTAINER=$(docker ps --format '{{.Names}}' | head -n1) || CONTAINER=$1

#docker exec -u ros -it -w /workspaces/pilsbot_vscode_ws/ --detach $CONTAINER ./in_correct_dir_launch_pilsbot_stack.sh
docker exec -u ros -it -w /workspaces/pilsbot_vscode_ws/ $CONTAINER bash

