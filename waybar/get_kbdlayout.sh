#!/bin/bash

layout=$(hyprctl devices | grep "active keymap" | awk '{print $3 " " $4}' | sort | uniq | head -n1)

echo $layout