#!/bin/bash
set -e

i2cset -y -r 1 0x20 0x00 0x00
i2cset -y -r 1 0x20 0x14 0xff

echo "Emulating \"ON\" button press is actually implemented. ROS2 'head_mcu' will do that."
