#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <file> <old_string> <new_string>"
    exit 1
fi

FILE=$1
OLD=$2
NEW=$3

if [ ! -f "$FILE" ]; then
    echo "File not found"
    exit 1
fi

sed -i "s/$OLD/$NEW/g" "$FILE"

SIZE=$(stat -c %s "$FILE")
HASH=$(sha256sum "$FILE" | awk '{print $1}')
DATE=$(date)

echo "$FILE - $SIZE - $DATE - $HASH" >> files.log

echo "Done."
