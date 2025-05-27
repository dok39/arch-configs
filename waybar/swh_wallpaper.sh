#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpaper"
INDEX_FILE="$HOME/.cache/wallpaper_index"
LIST_FILE="$HOME/.cache/wallpaper_list"

find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" \) | sort > "$LIST_FILE"

TOTAL=$(wc -l < "$LIST_FILE")
if [ "$TOTAL" -eq 0 ]; then
    echo "Wallpaper folder is empty"
    exit 1
fi

    [ ! -f "$INDEX_FILE" ] && echo 0 > "$INDEX_FILE"

    INDEX=$(<"$INDEX_FILE")
if [[ ! "$INDEX" =~ ^[0-9]+$ ]]; then 
    INDEX=0
fi

    WALLPAPER=$(sed -n "$((INDEX + 1))p" "$LIST_FILE")

    swww img "$WALLPAPER"

    echo $(( (INDEX + 1) % TOTAL )) > "$INDEX_FILE"

    echo "$((INDEX + 1))/$TOTAL"