PS: If any nuclear war occurs because of this, I am not responsible. this is my first time using GitHub to distribute something. use at your discretion

# XAI Telegram Notifier

This script monitors your specified screen session and sends updates to Telegram.

## Installation
### 1. Setting up a bot:


   #Visit BotFather

      open t.me\BotFather
   
      Click the "Start" button to initiate a chat.
      Create a New Bot:
      

   #Send the /newbot command to BotFather.
      Follow the instructions provided by BotFather to create a new bot.

   #Choose a Name:
      BotFather will prompt you to choose a name for your bot. You can pick a unique and descriptive name that users will see when interacting with your bot.

   #Choose a Username:
      After selecting a name, BotFather will ask you to choose a username. The username must end with "bot" (e.g., "my_cool_bot").

   #Receive Token:
      Upon choosing a username, BotFather will generate a token for your bot. Keep this token secure, as it is crucial for interacting with the Telegram Bot API.

   #Bot Created:
      BotFather will confirm that your bot has been created and provide a link to your bot's profile.

   #Save the message as it contains your bot token.

   #Open Your Bot and Start It:
      Locate the bot you created by searching for its username.
      Start the bot.

   #Create a Channel:
      Create a channel in Telegram.

   #Add the Bot to the Channel:
      Add the bot to the channel as an admin.

   #Get the Chat ID of the Channel:
      Use the t.me/chat_id_echo_bot bot to get the chat ID of your channel.
      
   The chat ID looks like "-1001234567890" (note the '-' is also a part of the ID).      

### 2. Setting up notifications

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
   4. enter the name of the screen in which the node is running (most of us named it "xai")

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
