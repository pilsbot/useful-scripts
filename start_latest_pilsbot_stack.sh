#!/bin/bash

#todo: make sure docker binds to correct interwebs interface

if ping -c 2 pilsbot.de &> /dev/null
then
  echo "You seem to have a working internet connection, lets pull the newest docker image from the interwebs"
  docker pull pilsbot/pilsbot_hw_ros:latest
fi

echo "For joystick teleop, type 'ros2 launch pilsbot_driver pilsbot_teleop.launch.py'"
# see pilsbot_vscode_ws/.devcontainer/devcontainer.json
docker run -it --privileged --gpus=all --volume=/media/sda/bags:/workspaces/bags --volume=/tmp/argus_socket:/tmp/argus_socket --network=host --cap-add=SYS_PTRACE --security-opt=seccomp:unconfined --security-opt=apparmor:unconfined --volume=/tmp/.X11-unix:/tmp/.X11-unix  --volume /dev:/dev pilsbot/pilsbot_hw_ros:latest
