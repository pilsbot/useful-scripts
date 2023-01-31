#!/bin/bash
set -e

./enable_motors.bash
./setup_serials.bash
./start_latest_pilsbot_stack.sh
./disable_motors.bash
