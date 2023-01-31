#!/bin/sh
base_path="/dev/i2c-"
for bus in $base_path*; do
	num=${bus#"$base_path"}
	echo "Scanning $bus (num $num)"
	i2cdetect -y -r $num
done
