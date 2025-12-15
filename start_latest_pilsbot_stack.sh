#!/bin/bash

set -e
set -x

#todo: make sure docker binds to correct interwebs interface

# Deactivated ping, because we have hacked ourn own container anyway
if false && ping -c 2 pilsbot.de &> /dev/null
then
  echo "You seem to have a working internet connection, lets pull the newest docker image from the interwebs"
  docker pull pilsbot/pilsbot_hw_ros:latest
fi

daemon_type="" #-it, --detach or empty

general="--name pilsbot_stack \
	--privileged \
        --rm \
        --user ros \
        --gpus=all \
        --network=host --cap-add=SYS_PTRACE \
        --security-opt=seccomp:unconfined \
        --security-opt=apparmor:unconfined \
"


volumes="--volume /tmp/argus_socket:/tmp/argus_socket \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --volume /dev:/dev \
        --volume /media/externSSD/bags:/workspaces/bags \
        --volume /home/pilsbot/pilsbot_vscode_ws:/workspaces/pilsbot_vscode_ws \
"

#pilsbot/pilsbot_hw_ros:latest
container=vsc-pilsbot_vscode_ws-df0237f349a7283206d3077a15ceb2c3b24dcd957bb7227b1153bdbc4800c0d7-uid

# ros2 launch pilsbot_bringup pilsbot.launch.py #TODO: Find out how to source correct workspace and then start
command="/workspaces/pilsbot_vscode_ws/in_correct_dir_launch_pilsbot_stack_in_kohlmode.sh"

echo "For joystick teleop, type 'ros2 launch pilsbot_bringup pilsbot.launch.py'"

# see pilsbot_vscode_ws/.devcontainer/devcontainer.json
exec docker run $daemon_type $general $volumes $container $command

