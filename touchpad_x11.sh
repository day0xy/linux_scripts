#!/bin/sh
# Toggle touchpad status
# Using libinput and xinput

# Use xinput list and do a search for touchpads. Then get the first one and get its name.
device="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o | head -n1)"

# If it was activated, disable it and show "Disabling touchpad" notification. If it wasn't, enable it and show "Enabling touchpad" notification.
if [[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]]; then
	xinput disable "$device"
	notify-send "Disabling touchpad"
else
	xinput enable "$device"
	notify-send "Enabling touchpad"
fi
