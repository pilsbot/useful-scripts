#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Disable the motors however this script ends: normal end, a failing step
# (set -e), or a signal such as systemctl stop. Installed before enabling, so
# a half-done enable is undone too.
trap '"$SCRIPT_DIR"/disable_motors.bash' EXIT

$SCRIPT_DIR/enable_motors.bash
$SCRIPT_DIR/setup_serials.bash
$SCRIPT_DIR/start_latest_pilsbot_stack.sh
