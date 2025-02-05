#!/bin/bash

#todo: make sure docker binds to correct interwebs interface

if ping -c 2 pilsbot.de &> /dev/null
then
  echo "You seem to have a working internet connection, lets pull the newest docker image from the interwebs"
  docker pull pilsbot/pilsbot_hw_ros:latest
fi

echo "For joystick teleop, type 'ros2 launch pilsbot_bringup pilsbot.launch.py'"
# see pilsbot_vscode_ws/.devcontainer/devcontainer.json
docker run -it \
--privileged \
--user ros \
--gpus=all \
--volume=/tmp/argus_socket:/tmp/argus_socket \
--network=host --cap-add=SYS_PTRACE \
--security-opt=seccomp:unconfined \
--security-opt=apparmor:unconfined \
--volume=/tmp/.X11-unix:/tmp/.X11-unix \
--volume /dev:/dev \
--volume=/media/externSSD/bags:/workspaces/bags \
--volume /home/pilsbot/pilsbot_vscode_ws:/workspaces/pilsbot_vscode_ws \
vsc-pilsbot_vscode_ws-df0237f349a7283206d3077a15ceb2c3b24dcd957bb7227b1153bdbc4800c0d7-uid #\
# ros2 launch pilsbot_bringup pilsbot.launch.py #TODO: Find out how to source correct workspace and then start


#pilsbot/pilsbot_hw_ros:latest

