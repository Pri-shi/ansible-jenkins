#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 2 ]; then
    echo "No Ip Address/Password Provided "
    exit 1
fi

# Set the username and the path to the SSH key on the local machine
username=root
ssh_key_file_name='~/.ssh/id_rsa'$3
ssh_key_path='~/.ssh/id_rsa'$3'.pub'
echo $ssh_key_path

# Set the list of remote servers using the arguments provided
pass=$2
echo "pass $2"
# Shift the first argument off the array
shift

# Now $@ contains all arguments except the first one
echo "server $3"
echo "ssh-keygen -f $ssh_key_file_name -r $3 "
ssh-keygen -f $ssh_key_file_name -R $3
echo "keygen completed"
echo "starting for $3..."
echo "Copying SSH key to $3..."
echo "ssh-copy-id -i $ssh_key_path  $2@$3"
sshpass $2 | ssh-copy-id -i "$ssh_key_path" "$2@$3"

