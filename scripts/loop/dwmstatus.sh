#!/bin/sh

while true; do
    # Initial padding
    statusbar="  "

    # RAM used
    MEM=$(free -h | grep Mem)
    MEMUSED=$(echo $MEM | awk '{print $3}')
    MEMUTOT=$(echo $MEM | awk '{print $2}')
    statusbar+=$(printf "MEM %s/%s | " "$MEMUSED" "$MEMUTOT")

    # CPU
    statusbar+=$(printf "CPU %s | " "$CPU")
    CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%

    # Keyboard
    #statusbar+=$(printf "%s | " "$(setxkbmap -query | awk '/layout/{print $2}')")

    # Show tasks to be completed if amount > 0
    TASK=$(wc -l ~/documents/todo | awk '{print $1}')
    if [ $TASK -gt 0 ]; then
        statusbar+=$(printf "TODO %s | " "$TASK")
    fi

    # Date and time
    statusbar+=$(printf "%s" "$(date "+%a %B %d | %I:%M:%S ")")

    # End padding
    statusbar+=" "

    xsetroot -name "$statusbar"
    sleep 0.9s
done
