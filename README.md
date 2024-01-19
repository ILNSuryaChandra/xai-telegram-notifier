# XAI Telegram Notifier

This script monitors your specified screen session and sends updates to Telegram.

## Installation
1. setting up a bot:
      Start a Chat with BotFather:
         Open the Telegram app and search for "BotFather" or go directly to @BotFather. Start a chat with BotFather by clicking the "Start" button.
   
      Create a New Bot:
         Send the /newbot command to BotFather. Follow the instructions, and BotFather will guide you through the process of creating a new bot.
   
      Choose a Name:
         BotFather will ask you to choose a name for your bot. This is the name that users will see when interacting with your bot. Pick a unique and descriptive name.
   
      Choose a Username:
         After selecting a name, BotFather will ask you to choose a username for your bot. The username must end with "bot" (e.g., "my_cool_bot").
   
      Receive Token:
         Once you've chosen a username, BotFather will generate a token for your new bot. The token is a long string of characters and numbers. Keep this token secure, as it is the key to interacting with the Telegram Bot API on behalf of your bot.

      Bot Created:
         BotFather will provide a message indicating that your bot has been created. It will also give you a link to your bot's profile.

      save this message as it contains your bot token.
   
      open the bot you just created (search for the bot's username) and start it.

      Create a group or a channel and add the bot to the group or channel as an admin.

      send a test message to the group or channel.
   
      open

         https://api.telegram.org/bot<YourBotToken>/getUpdates

      replace <YourBotToken> with the bot token provided to you by the BotFather

      you will find something like this
      ```json
      "chat": {
      "id": -1001234567890,
      "title": "Your Group Name",
       ...
      }
      ```
      
      here "id" value is the chat ID of your group or channel in which you want to receive the notifications in.
      

2. setting up notifications


i. Start a screen

   ```bash
      sudo apt update
      sudo apt install screen
      screen -S telegram_monitor
   ```

ii. Run the setup script:

   ```bash
   #Downloading required files
   curl -L -o xai-telegram-notifier.zip https://github.com/ILNSuryaChandra/xai-telegram-notifier/releases/latest/download/xai-telegram-notifier.zip

   #Extracting files
   unzip xai-telegram-notifier.zip

   #changing directory
   cd xai-telegram-notifier

   #giving permissions
   chmod +x setup.sh

   #running setup
   ./setup.sh
   ```
   follow the instructions on the screen:
   1. enter your chat ID (chat ID which you have obtained while setting up the bot
   2. enter your bot token which was given by BotFaher
   3. enter the time interval in seconds (more than 1800 recommended to avoid rate limit)

