#!/bin/bash

# Source the configuration file
source config.txt

while true; do
    # Use 'script' to capture the output of the target screen session
    script -q -c "screen -S $SCREEN_SESSION_NAME -X hardcopy /tmp/screen_output" /dev/null

    # Get the last few lines from the captured output
    LAST_OUTPUT=$(tail -n 5 /tmp/screen_output)

    # Send the last output to Telegram
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d "chat_id=$TELEGRAM_CHAT_ID" \
        -d "text=$LAST_OUTPUT"

    # Clear the temporary output file
    rm /tmp/screen_output

    # Adjust the interval as needed
    sleep $NOTIFICATION_INTERVAL
done

