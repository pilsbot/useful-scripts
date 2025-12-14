#!/bin/bash
set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
[ -z "$1" ] && CONTAINER=$(docker ps --format '{{.Names}}' | head -n1) || CONTAINER=$1

docker stop --time 30 $CONTAINER
$SCRIPT_DIR/disable_motors.bash
