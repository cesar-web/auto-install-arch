#!/bin/sh

while true; do
    setxkbmap -layout latam &
    setxkbmap -option caps:swapescape &
    sleep 1s
done

