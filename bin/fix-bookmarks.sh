#!/bin/bash
set -e
bookmarks_file="$(pwd)/bookmarks/bookmarks.html"
if test ! -e "$bookmarks_file"; then
    echo "$bookmarks_file doesn't exist!"
    echo "Import it first from Firefox."
    exit 1
fi

quickmarks_file="$(pwd)/bookmarks/quickmarks.html"

config="$HOME/.config"
config_quickmarks="$config/qutebrowser/quickmarks"

# Import quickmarks
rsync -uav $quickmarks_file $config_quickmarks

# Uncomment this if you want to import bookmarks in quickmarks
# truncate -s 0 "$quickmarks" # Clear quickmarks
#python /usr/share/qutebrowser/scripts/importer.py "$bookmarks_file" >> "$quickmarks"
echo "Bookmarks imported!"
