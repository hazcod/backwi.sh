#!/usr/bin/env bash

triggerssid="$1"
destination="$2"
airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

if [ -z "$triggerssid" ] || [ -z "$destination" ]; then
	echo "Usage: $0 <ssid> <backup-destination>"
	exit 1
fi

ssid=$($airport -I | grep ' SSID' | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

if [ "$ssid" != "$triggerssid" ]; then
	exit 0
fi

id=$(tmutil destinationinfo -X | grep -C2 -o "$destination" | grep -C1 ID | grep string | cut -d '>' -f 2 | cut -d '<' -f 1)

if [ -z "$id" ]; then
	echo "ERROR: Backup destination not found: $destination"
	exit 1
fi

echo "Triggering backup for $destination"
tmutil startbackup --destination "$id"