#!/bin/bash
bookmarks_file="$HOME/bookmarks.html"
config="$HOME/.config"
quickmarks="$config/qutebrowser/quickmarks"
# Clear all quickmarks
truncate -s 0 "$quickmarks"
python /usr/share/qutebrowser/scripts/importer.py $bookmarks_file >> "$quickmarks"
