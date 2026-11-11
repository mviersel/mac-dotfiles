#!/bin/sh

DEFCOLOR="0x4459636f"
ALERTCOLOR="0x99d46a6a"
TOTALSWAP="$(sysctl vm.swapusage | awk '{print $4}')"

clr=""
if [ "$TOTALSWAP" != "0.00M" ]; then
    clr="$ALERTCOLOR"
else
    clr="$DEFCOLOR"
fi

sketchybar --set "$NAME" label="$TOTALSWAP" icon.color="$clr" label.color="$clr"
