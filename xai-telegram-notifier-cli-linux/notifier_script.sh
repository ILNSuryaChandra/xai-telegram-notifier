#!/bin/bash

# Source the configuration file
source config.txt

# Define the file to store the logs
LOG_FILE="/tmp/node_logs.txt"

while true; do
    # Use 'script' to capture the output of the target screen session
    script -q -c "screen -S $SCREEN_SESSION_NAME -X hardcopy $LOG_FILE" /dev/null

    # Get the last 1000 lines from the log file
    LAST_OUTPUT=$(tail -n 1000 $LOG_FILE)

    # Check if the output contains the keyword
    if echo "$LAST_OUTPUT" | grep -q "ChallengeSubmitted"; then
        # Extract the timestamp from the output (assuming it's in the format [YYYY-MM-DDTHH:mm:ss.sssZ])
        TIMESTAMP=$(echo "$LAST_OUTPUT" | grep -oP '\[\K[^\]]+')

        # Convert the timestamp to seconds since epoch
        TIMESTAMP_SECONDS=$(date -u -d "$TIMESTAMP" '+%s')

        # Get the current time in seconds since epoch
        CURRENT_TIME_SECONDS=$(date -u '+%s')

        # Check if the update is within the last 3 minutes
        if (( CURRENT_TIME_SECONDS - TIMESTAMP_SECONDS <= 180 )); then
            # Send the status message to Telegram
            STATUS_MESSAGE="Node is running fine. Last update: $LAST_OUTPUT"
            curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
                -d "chat_id=$TELEGRAM_CHAT_ID" \
                -d "text=$STATUS_MESSAGE"
        else
            # Send an alert message if the update is older than 3 minutes
            ALERT_MESSAGE="Alert! Node update is older than 3 minutes. Last update: $LAST_OUTPUT"
            curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
                -d "chat_id=$TELEGRAM_CHAT_ID" \
                -d "text=$ALERT_MESSAGE"
        fi
    else
        # Send an alert message if the keyword is not found
        ALERT_MESSAGE="Alert! Keyword 'ChallengeSubmitted' not found in the last 1000 lines."
        curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
            -d "chat_id=$TELEGRAM_CHAT_ID" \
            -d "text=$ALERT_MESSAGE"
    fi

    # Clear the temporary log file
    rm $LOG_FILE

    # Check if it's a new day (compare current date with the date of the last log entry)
    if [[ "$(date -u '+%Y-%m-%d')" != "$(tail -n 1 $LOG_FILE | grep -oP '\[\K[^\]]+')" ]]; then
        # Clear the log file at the end of the day
        rm $LOG_FILE
    fi

    # Adjust the interval as needed
    sleep $NOTIFICATION_INTERVAL
done
