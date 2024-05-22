#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 2 ]; then
    echo "No Ip Address/Password Provided "
    exit 1
fi

# Set the username and the path to the SSH key on the local machine
username=$3
password=$2
ip=$1
ssh_key_path='~/.ssh/id_rsa.pub'
echo $ssh_key_path

echo "STARTING ssh-keygen -r $3 "
ssh-keygen -R $3
echo "keygen COMPLETED"

echo "Copying SSH key to $3..."
echo "ssh-copy-id -i $ssh_key_path  $2@$1"
sshpass $2 | ssh-copy-id -i "$ssh_key_path" "$2@$1"

