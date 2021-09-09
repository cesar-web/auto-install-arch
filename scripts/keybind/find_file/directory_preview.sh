#!bin/sh

currentdir=$1
absolutedir=$(dirname $currentdir)
exa -al --icons --color=always --group-directories-first $absolutedir
