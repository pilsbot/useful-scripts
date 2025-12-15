#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$SCRIPT_DIR/enable_motors.bash
$SCRIPT_DIR/setup_serials.bash
$SCRIPT_DIR/start_latest_pilsbot_stack.sh
$SCRIPT_DIR/disable_motors.bash
