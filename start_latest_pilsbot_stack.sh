#!/bin/bash

#todo: make sure docker binds to correct interwebs interface
echo "For joystick teleop, type 'ros2 launch pilsbot_driver pilsbot_teleop.launch.py'"
docker run -it --privileged --net=host --volume /dev:/dev pilsbot/pilsbot_hw_ros:latest
