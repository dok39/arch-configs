#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpaper"
INDEX_FILE="$HOME/.cache/wallpaper_index"
LIST_FILE="$HOME/.cache/wallpaper_list"

find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" \) | sort > "$LIST_FILE"

TOTAL=$(wc -l < "LIST_FILE")
if [ "$TOTAL" -eq 0 ]; then
    echo "Wallpaper folder is empty"
    exit 1
fi

else