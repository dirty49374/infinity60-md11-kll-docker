#!/bin/sh
echo "wait 3 secs..."
sleep 3
dfu-util --download kiibohd/output/MD11_DIRTY49374.gcc/kiibohd.dfu.bin

