# shell-tg-bot
A simple bot to run functions or scripts.

Several CHAT_ID can be used to share a gap.

The running file has `functions` you can create a file and place  functions there after being used in the commands.

For more advanced use there is an ansible playbook `playbook.yml`, for use you need to specify three values: `hosts` `telegram_token` `telegram_chat_id`.

[Link](https://hub.docker.com/r/mkovdk/shell-tgbot) to Docker Hub

## Usage

To use the Telegram Bot API, you first have to get a bot account by chatting with [BotFather](https://core.telegram.org/bots#6-botfather).
```
docker run -d --name shell-tg \
  -e TOKEN= \
  -e CHAT_ID= \
  --restart unless-stopped \
 mkovdk/shell-tgbot
