#!/bin/sh

FILENAME=$1
NAME=$(echo "$FILENAME" | cut -f 1 -d '.')
OUTPUT="${NAME}.mgfx"

echo "Recived file ${FILENAME}"
echo "Compiling Effect ${FILENAME} to ${OUTPUT}"
MGFXC_WINE_PATH=/home/wine/.winemonogame /home/wine/.dotnet/tools/mgfxc $FILENAME $OUTPUT