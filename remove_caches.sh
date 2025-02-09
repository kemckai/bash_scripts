#!/bin/bash

# Clear user cache
rm -rf "$HOME/Library/Caches/*"

# Clear system logs older than 30 days
find /var/log -type f -mtime +30 -exec rm -f {} \;

# Clear temporary files
rm -rf /tmp/*

echo "System cleanup completed."