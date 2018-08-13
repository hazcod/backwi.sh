# backwi.sh
Triggers a TimeMachine backup when you're connected to a specific Wireless Network.

## Usage
`./backwi.sh <ssid-that-triggers backup> <backup-destination>`

## Automation
Copy `backwi.plist` to `~/Library/LaunchAgents/com.hazcod.backwi.plist` and adapt the settings.
Now enable it with `launchctl load ~/Library/LaunchAgents/com.hazcod.backwi.plist`.
Logs can be viewed with `tail -f /var/log/system.log`.
