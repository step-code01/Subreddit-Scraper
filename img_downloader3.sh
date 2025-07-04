#!/bin/bash

LIMIT=10 #Reddit's API only allows maximum 100 at a time, so be careful for that.

RESPONSE=$(curl "https://www.reddit.com/r/pics/top/.json?t=all&limit=$LIMIT" -A "Mozilla/5.0") 

for i in $(seq 0 $((LIMIT-1))); do
    IMAGE_URL=$(echo "$RESPONSE" | jq -r ".data.children[$i].data.url_overridden_by_dest")

if [[ $IMAGE_URL =~ \.(jpg|jpeg|png|gif)$ ]]; then
        EXT="${IMAGE_URL##*.}"
        echo "Downloading image from: $IMAGE_URL"
        wget -q "$IMAGE_URL" -O "reddit_image_$i.$EXT"
        echo "Image saved as reddit_image_$i.$EXT"
    
else
        echo "[$i] Skipped: Not an image or missing URL."
fi

done

:'line 5, need to pretend to be a browser since reddit blocks unknown/empty user agent. 
Makes reddit think request is coming from a legit browser.
This makes the scraping possible.'
