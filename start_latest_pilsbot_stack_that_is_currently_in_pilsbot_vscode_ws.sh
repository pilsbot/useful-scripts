#!/bin/bash

#todo: make sure docker binds to correct interwebs interface
cd /home/pilsbot/pilsbot_vscode_ws


if ping -c 2 pilsbot.de &> /dev/null
then
  echo "You seem to have a working internet connection, lets pull and build"
  git pull
  docker pull pilsbot/foxy-jetson:dev
  pushd .devcontainer
  docker build . -t latest-pilsbot
  popd
fi

if [[ "$(docker images -q latest-pilsbot 2> /dev/null)" == "" ]]; then
  pushd .devcontainer
  docker build . -t latest-pilsbot
  popd
  echo "TODO: Automate this"
  echo "vcs import --recursive < src/ros2.repos src"
  echo "colcon build --merge-install --symlink-install --cmake-args '-DCMAKE_BUILD_TYPE=RelWithDebInfo' '-DCMAKE_EXPORT_COMPILE_COMMANDS=On' -Wall -Wextra -Wpedantic"
  echo "sudo apt-get update && rosdep update && rosdep install --from-paths src --ignore-src -y"
fi

echo "For joystick teleop, type 'ros2 launch pilsbot_driver pilsbot_teleop.launch.py'"
echo "For logging everything: ros2 bag record -a"
# see pilsbot_vscode_ws/.devcontainer/devcontainer.json
docker run -it --privileged --gpus=all --volume=/media/sda/bags:/workspaces/bags --volume=/tmp/argus_socket:/tmp/argus_socket --network=host --cap-add=SYS_PTRACE --security-opt=seccomp:unconfined --security-opt=apparmor:unconfined --volume=/tmp/.X11-unix:/tmp/.X11-unix -u ros --volume /dev:/dev --volume /home/pilsbot/pilsbot_vscode_ws:/workspaces/pilsbot_vscode_ws latest-pilsbot
