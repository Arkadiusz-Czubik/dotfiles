#!/bin/bash

swap_to_monitor=$1
swap_to_monitor_current_workspace=$(i3-msg -t get_outputs | jq -r ".[] | select(.name==\"$swap_to_monitor\") | .current_workspace")
source_monitor=$(i3-msg -t get_outputs | jq -r ".[] | select(.primary==true) | .name")
source_monitor_current_workspace=$(i3-msg -t get_outputs | jq -r ".[] | select(.name==\"$source_monitor\") | .current_workspace")

echo "Swap to monitor: $swap_to_monitor"
echo "Swap to monitor current workspace: $swap_to_monitor_current_workspace"
echo "Source monitor: $source_monitor"
echo "Source monitor current workspace: $source_monitor_current_workspace"

i3-msg move workspace to output $swap_to_monitor
i3-msg workspace $swap_to_monitor_current_workspace
i3-msg move workspace to output $source_monitor
