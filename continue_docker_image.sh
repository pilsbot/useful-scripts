#!/bin/bash
set -x

[ -z "$1" ] && CONTAINER=keen_shirley || CONTAINER=$1

docker start $CONTAINER
docker attach $CONTAINER
