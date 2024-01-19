#!/bin/bash

# Download the latest release
curl -L -o xai-telegram-notifier-cli-linux.zip https://github.com/ILNSuryaChandra/xai-telegram-notifier/releases/latest/download/xai-telegram-notifier-cli-linux.zip

# Unzip the file
unzip xai-telegram-notifier-cli-linux.zip

# Go into the directory
cd xai-telegram-notifier-cli-linux

# Create a configuration file
echo "Enter your Telegram Chat ID:"
read TELEGRAM_CHAT_ID

echo "Enter your Telegram Bot Token:"
read TELEGRAM_BOT_TOKEN

echo "Enter notification interval (in seconds):"
read NOTIFICATION_INTERVAL

echo "Enter the name of the screen to monitor:"
read SCREEN_SESSION_NAME

# Write configuration to a file
echo "TELEGRAM_CHAT_ID=$TELEGRAM_CHAT_ID" > config.txt
echo "TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN" >> config.txt
echo "NOTIFICATION_INTERVAL=$NOTIFICATION_INTERVAL" >> config.txt
echo "SCREEN_SESSION_NAME=$SCREEN_SESSION_NAME" >> config.txt

# Make the notifier script executable
chmod +x notifier_script.sh

# Run the notifier script
./notifier_script.sh

