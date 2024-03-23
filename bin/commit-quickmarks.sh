#!/bin/bash
set -e
quickmarks_file="bookmarks/quickmarks.html"
config_quickmarks="$HOME/.config/qutebrowser/quickmarks"
rsync -uav $config_quickmarks $quickmarks_file
echo "Quickmarks imported! Now commit!"
