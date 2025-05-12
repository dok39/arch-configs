#!/bin/bash
language=$(hyprctl devices | grep "active keymap" | awk '{print $3, $4}')
if [ "$language!=$previous_language" ];then 
echo "$language"
previous_language="$language"
fi
