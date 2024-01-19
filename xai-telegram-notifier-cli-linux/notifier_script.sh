#!/bin/bash

# Source the configuration file
source config.txt

while true; do
    # Use 'script' to capture the output of the target screen session
    script -q -c "screen -S $SCREEN_SESSION_NAME -X hardcopy /tmp/screen_output" /dev/null

    # Get the last 1000 lines from the captured output
    LAST_OUTPUT=$(tail -n 1000 /tmp/screen_output)

    # Filter the lines containing 'ChallengeSubmitted'
    CHALLENGE_SUBMITTED=$(echo "$LAST_OUTPUT" | grep 'ChallengeSubmitted')

    # Check if 'ChallengeSubmitted' is found in the last 3 minutes
    if [[ $(date -u -d"$(echo "$LAST_OUTPUT" | grep -Eo '\[.*Z\]' | tail -n 1)" +"%s") -ge $(date -u -d"3 minutes ago" +"%s") ]] && [ -n "$CHALLENGE_SUBMITTED" ]; then
        ALERT_MESSAGE="Node is working as intended."
    else
        ALERT_MESSAGE="Alert! Node update is older than 3 minutes or 'ChallengeSubmitted' not found."
    fi

    # Send the alert message to Telegram
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d "chat_id=$TELEGRAM_CHAT_ID" \
        -d "text=$ALERT_MESSAGE"

    # Clear the temporary output file
    rm /tmp/screen_output

    # Adjust the interval as needed
    sleep $NOTIFICATION_INTERVAL
done
