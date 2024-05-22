#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "No Ip Address Provided "
    exit 1
fi

# Set the username and the path to the SSH key on the local machine
username=root
ssh_key_path=~/.ssh/id_rsa.pub

# Set the list of remote servers using the arguments provided
servers=("$@")

echo "ssh-keygen -r $@ "
ssh-keygen -R $@
echo "keygen completed"
# Loop through the servers and copy the SSH key
for server in "${servers[@]}"
do
    echo "starting for $server..."
    echo "Copying SSH key to $server..."
    echo "ssh-copy-id -i $ssh_key_path  $username@$server"
    ssh-copy-id -i "$ssh_key_path" "$username@$server"
done

