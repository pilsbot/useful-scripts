#!/usr/bin/env bash
set -e

sudo cp ./50-ds4drv.rules /etc/udev/rules.d/
echo "Reloading udev rules and trigger new rules"
sudo udevadm control --reload-rules
sudo udevadm trigger

