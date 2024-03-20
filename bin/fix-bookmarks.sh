#!/bin/bash
bookmarks_file="./bookmarks.html"
if test ! -e $bookmarks_file; then
    echo "$bookmarks_file doesn't exist!"
    echo "Import it first from Firefox."
    exit 1
fi

config="$HOME/.config"
quickmarks="$config/qutebrowser/quickmarks"
# Clear all quickmarks
truncate -s 0 "$quickmarks"

python /usr/share/qutebrowser/scripts/importer.py $bookmarks_file >> "$quickmarks"
