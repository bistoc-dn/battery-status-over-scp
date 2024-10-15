# system wide (doesnt work right now)
#sudo cp com.user.batterystatusscp.plist /Library/LaunchDaemons/
#sudo chown root:wheel /Library/LaunchDaemons/com.user.batterystatusscp.plist
#sudo chmod 644 /Library/LaunchDaemons/com.user.batterystatusscp.plist
#sudo launchctl load /Library/LaunchDaemons/com.user.batterystatusscp.plist
#sudo launchctl list | grep com.user.batterystatusscp

# user specific:
cp com.user.batterystatusscp.plist ~/Library/LaunchAgents/
chown $USER:staff ~/Library/LaunchAgents/com.user.batterystatusscp.plist
chmod 644 ~/Library/LaunchAgents/com.user.batterystatusscp.plist
launchctl load ~/Library/LaunchAgents/com.user.batterystatusscp.plist
launchctl list | grep com.user.batterystatusscp

