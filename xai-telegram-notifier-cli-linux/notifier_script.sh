{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
# Source the configuration file\
source config.txt\
\
while true; do\
    # Use 'script' to capture the output of the target screen session\
    script -q -c "screen -S $SCREEN_SESSION_NAME -X hardcopy /tmp/screen_output" /dev/null\
\
    # Get the last few lines from the captured output\
    LAST_OUTPUT=$(tail -n 5 /tmp/screen_output)\
\
    # Send the last output to Telegram\
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \\\
        -d "chat_id=$TELEGRAM_CHAT_ID" \\\
        -d "text=$LAST_OUTPUT"\
\
    # Clear the temporary output file\
    rm /tmp/screen_output\
\
    # Adjust the interval as needed\
    sleep $NOTIFICATION_INTERVAL\
done\
}