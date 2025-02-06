# tgbot
A simple bot to run functions or scripts.

Several CHAT_ID can be used to share a gap.

The running file has `functions` you can create a file and place  functions there after being used in the commands.

## Usage

To use the Telegram Bot API, you first have to get a bot account by chatting with [BotFather](https://core.telegram.org/bots#6-botfather).
```
docker run -d --name tgbot \
  -e TOKEN= \
  -e CHAT_ID= \
  --restart unless-stopped \
 <имя docker образа при сборке>
