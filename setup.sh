{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
# Download the latest release\
curl -L -o xai-telegram-notifier-cli-linux.zip https://github.com/ILNSuryaChandra/xai-telegram-notifier/releases/latest/download/xai-telegram-notifier-cli-linux.zip\
\
# Unzip the file\
unzip xai-telegram-notifier-cli-linux.zip\
\
# Go into the directory\
cd xai-telegram-notifier-cli-linux\
\
# Create a configuration file\
echo "Enter your Telegram Chat ID:"\
read TELEGRAM_CHAT_ID\
\
echo "Enter your Telegram Bot Token:"\
read TELEGRAM_BOT_TOKEN\
\
echo "Enter notification interval (in seconds):"\
read NOTIFICATION_INTERVAL\
\
echo "Enter the name of the screen to monitor:"\
read SCREEN_SESSION_NAME\
\
# Write configuration to a file\
echo "TELEGRAM_CHAT_ID=$TELEGRAM_CHAT_ID" > config.txt\
echo "TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN" >> config.txt\
echo "NOTIFICATION_INTERVAL=$NOTIFICATION_INTERVAL" >> config.txt\
echo "SCREEN_SESSION_NAME=$SCREEN_SESSION_NAME" >> config.txt\
\
# Make the notifier script executable\
chmod +x notifier_script.sh\
\
# Run the notifier script\
./notifier_script.sh\
}