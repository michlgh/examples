#!/bin/bash

chat_id=$CHAT_ID
token=$TOKEN

message_time_file=message_time_file.txt

send_message() {
    curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" -d chat_id="$1" -d text="$2"
}

update_commands() {
 curl -s -X POST "https://api.telegram.org/bot$token/setMyCommands" -H "Content-Type: application/json" -d '{
     "commands": [
         {"command": "start", "description": "Start the bot"},
         {"command": "help", "description": "Show help message"}
     ]
 }'
}

if [ -f ./functions ]; then
	source ./functions
	echo "Functions is Load"
fi

if [ ! -f $message_time_file ]; then
    touch $message_time_file
    echo "Temporary last message file is created"
fi    

while true; do
    curl -s "https://api.telegram.org/bot$token/getUpdates?offset=-1" | jq -r '.result[].message.date // empty' | while read -r message_time; do


        if [ $message_time = $(<$message_time_file) ]; then
            continue
        fi

        echo "$message_time" > "$message_time_file"

        curl -s "https://api.telegram.org/bot$token/getUpdates?offset=-1" | jq -r '.result[].message.chat.id // empty' | while read -r _id; do

            if [ "$_id" == "null" ] || [ -z "$_id" ]; then
                continue
            fi

            if ! echo "$chat_id" | grep -q "$_id"; then
                continue
            fi

            curl -s "https://api.telegram.org/bot$token/getUpdates?offset=-1" | jq -r '.result[].message.text // empty' | while read -r updates; do

                if [ "$updates" == "null" ] || [ -z "$updates" ]; then
                    continue
                fi

				case $updates in
					"/start")
						send_message "$_id" "Hey, I'm a console chat bot. Use the team block for interaction 📁"
                	    ;;
					"/update_commands")
        	            update_commands "$_id" "Telegram command list is update ✔️"
    	                ;;
					"/help")
        	            send_message "$_id" "To perform commands, use a set function block in an executable file."
	   	                ;;
	            esac
            done
        done
    done
done
