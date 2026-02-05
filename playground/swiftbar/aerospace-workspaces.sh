# !/usr/bin/env bash
# <swiftbar.refresh>2</swiftbar.refresh>

ACTIVE_WS=$(aerospace list-workspaces --focused)
ALL_WS=$(aerospace list-workspaces)

OUT=""

for ws in $ALL_WS; do
  if [[ "$ws" == "$ACTIVE_WS" ]]; then
    OUT+="[ ${ws}* ] "
  else
    OUT+="[ ${ws} ] "
  fi
done

echo "$OUT"
