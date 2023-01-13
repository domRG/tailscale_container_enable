#!/bin/bash

# Check if the container number is provided
if [ -z "$1" ]; then
    echo "Please provide a container number as a parameter"
    exit 1
fi

# Define the file path
file_path="/etc/pve/lxc/$1.conf"

# Define the lines to be added
line1="lxc.cgroup2.devices.allow: c 10:200 rwm"
line2="lxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file"

# Check if the lines already exist in the file
if ! grep -q "$line1" "$file_path" && ! grep -q "$line2" "$file_path"; then
    # Append the lines to the file
    echo "$line1" >> $file_path
    echo "$line2" >> $file_path
    echo "Lines added to $file_path"
else
    echo "Lines already exist in $file_path"
fi
