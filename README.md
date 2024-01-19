# XAI Telegram Notifier

This script monitors your specified screen session and sends updates to Telegram.

## Installation
1. setting up a bot:

      # Start a Chat with BotFather:
   
               t.me\BotFather
   
      Start a chat with BotFather by clicking the "Start" button.


      #Create a New Bot:
         Send the /newbot command to BotFather. Follow the instructions, and BotFather will guide you through the process of creating a new bot.


      #Choose a Name:
         BotFather will ask you to choose a name for your bot. This is the name that users will see when interacting with your bot. You can pick a unique and descriptive name.


      #Choose a Username:
         After selecting a name, BotFather will ask you to choose a username for your bot. The username must end with "bot" (e.g., "my_cool_bot").


      #Receive Token:
         Once you've chosen a username, BotFather will generate a token for your new bot. The token is a long string of characters and numbers. Please keep this token secure, as it is the key to interacting with the Telegram Bot API for your bot.



      #Bot Created:
         BotFather will provide a message indicating that your bot has been created. It will also give you a link to your bot's profile.


      #save this message as it contains your bot token.
   
      #open the bot you just created (search for the bot's username) and start it.

      #Create a channel and add the bot to the channel as an admin.

      #Use the following bot to get the chat id of your channel

         t.me/chat_id_echo_bot
   
      #Chat id of the channel looks like "-1001234567890"

      #Don't forget that '-' is also a part of the id.
      

3. setting up notifications


i. Start a screen

   ```bash
   sudo apt update
   screen -S monitor
   ```

ii. Run the setup script:

for a simpler status message(buggy, not working as intended for now):
   ```bash
   #Downloading required files
   curl -L -o xai-telegram-notifier.zip https://github.com/ILNSuryaChandra/xai-telegram-notifier/releases/latest/download/xai-telegram-notifier.zip
   ```

for the exact last message:
```bash
   #Downloading required files
   curl -L -o xai-telegram-notifier.zip https://github.com/ILNSuryaChandra/xai-telegram-notifier/releases/download/v1.0.0/xai-telegram-notifier.zip
   ```

extracting and running the script
```bash
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
   1. enter your channel's chat ID (chat ID which you have obtained while setting up the bot. Don't forget "-")
   2. enter your bot token which was given by BotFather
   3. enter the time interval in seconds (more than 1800 which is 30 minutes recommended to avoid the rate limit)
   4. enter the name of the screen in which the node is running (most of us named it as "xai")

iii. Detach the screen:
      press CTRL + A + D to detach the screen

**To stop the receiving notifications**:
reopen the screen by typing
```bash
screen -r monitor
```
and press ctrl + c

to delete the monitor screen:
use the following command from the main console
```bash
screen -X -S monitor quit
```

use the following command to see the list of all the running screens:
```bash
screen -ls
```
