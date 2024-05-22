#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 2 ]; then
    echo "No Ip Address/Password Provided "
    exit 1
fi

# Set the username and the path to the SSH key on the local machine
username=$1
password=$2
ip=$3
ssh_key_path='~/.ssh/id_rsa'
ssh_key_pub_path='~/.ssh/id_rsa.pub'
echo $ssh_key_path

echo "STARTING ssh-keygen "
ssh-keygen -t rsa -f $ssh_key_path -N ''
echo "keygen COMPLETED"
echo "pwd" pwd
ls ~/.ssh
cd ~/.ssh
echo "pwd" pwd
echo "Copying SSH key to $3..."
echo "echo: ssh-copy-id -i $ssh_key_pub_path  $1@$3"
sshpass -p $2 ssh-copy-id -i $ssh_key_pub_path $1@$3

