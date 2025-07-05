#!/bin/bash

LIMIT=100

RESPONSE=$(curl "https://www.reddit.com/r/progresspics/hot/.json?t=all&limit=$LIMIT" -A "Mozilla/5.0")

for i in $(seq 0 $((LIMIT-1))); do
    IMAGE_URL=$(echo "$RESPONSE" | jq -r ".data.children[$i].data.url_overridden_by_dest")
    
    if [[ -z "$IMAGE_URL" ]]; then
        echo "[$i] Skipped: No image URL found."
        continue
    fi
    
    if [[ $IMAGE_URL =~ \.(jpg|jpeg|png|gif)$ ]]; then
        EXT="${IMAGE_URL##*.}"
        echo "Downloading image from: $IMAGE_URL"
        wget -q "$IMAGE_URL" -O "reddit_image_$i.$EXT"
        echo "Image saved as reddit_image_$i.$EXT"
    else
        echo "[$i] Skipped: URL is not an image (or missing image format)."
    fi
done
