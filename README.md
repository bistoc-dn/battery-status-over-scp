# Battery Status Monitor (MacOS only)

⚠️ **IMPORTANT WARNING**: Do not forget to change `id_rsa`, `user`, and `ip` in the `com.user.batterystatusscp.plist` file before using it!

## Overview

This repository contains a launchd unit file for macOS that monitors the battery status of your MacBook and sends the information to a remote server every 2 minutes.

This repository is a dependency for [tmux-battery-remote](https://github.com/bistoc-dn/tmux-battery-remote). It provides the necessary battery monitoring functionality required by the plugin. For more information on how this integrates with it, please refer to the [tmux-battery-remote](https://github.com/bistoc-dn/tmux-battery-remote) documentation.

## Contents

- `com.user.batterystatusscp.plist`: The launchd unit file that runs the battery status monitoring script.
- `.install.sh`: The provided script for easy installation

## How It Works

The launchd job does the following every 2 minutes:

1. Runs `pmset -g batt` to get the current battery status.
2. Saves the output to a temporary file `/tmp/pmset_out`.
3. Uses `scp` to securely copy this file to a remote server.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/battery-status-monitor.git
   cd battery-status-monitor
   ```

2. Edit the `com.user.batterystatusscp.plist` file:
   - Replace `id_rsa` with your own SSH key
   - Replace `user` with your remote server username.
   - Replace `ip` with your remote server's IP address or hostname.

3. Run the installation script:
   ```bash
   sudo chmod +x install.sh && sudo ./install.sh
   ```

## Verification

To verify that the job is running:

```bash
launchctl list | grep com.user.batterystatusscp
```

This should display the job's Process ID (PID) if it's running successfully.

## Logs

- Standard output is logged to: `/tmp/batterystatusscp.out`
- Errors are logged to: `/tmp/batterystatusscp.err`

## Customization

You can modify the `StartInterval` key in the .plist file to change how often the script runs. The value is in seconds (default is 120 seconds or 2 minutes).

## Uninstalling

To remove the launchd job:

1. Unload the job:
   ```bash
   launchctl unload ~/Library/LaunchAgents/com.user.batterystatusscp.plist
   ```

2. Remove the .plist file:
   ```bash
   rm ~/Library/LaunchAgents/com.user.batterystatusscp.plist
   ```

