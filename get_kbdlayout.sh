#!/bin/bash
language=$(hyprctl devices | grep "active_keymap" | awk '{print $2}')
echo $language
