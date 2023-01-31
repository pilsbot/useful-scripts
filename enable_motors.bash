#!/bin/bash
set -e

i2cset -y -r 1 0x20 0x00 0x00
i2cset -y -r 1 0x20 0x14 0xff

echo "TODO: Emulating \"ON\" button press is not implemented yet. Please press it yourself on the hoverboard plate."
