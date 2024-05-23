#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "No Ip Address/Password/Username Provided "
    exit 1
fi

# Set the username and the path to the SSH key on the local machine
username=$1
password=$2
ip=$3
ssh_keypath='/var/jenkins_home/.ssh/id_rsa'
ssh_key_path='~/.ssh/id_rsa'
echo $ssh_key_path

echo "STARTING ssh-keygen "
#ssh-keygen -t rsa -f $ssh_key_path -N ''
ssh-keygen -t rsa -N '' -r -f $ssh_keypath
if [ $? -ne 0 ];
    then
        echo "ssh-keygen error!!"
        exit 1
    else
        echo "keygen COMPLETED"
fi

echo "Copying SSH key to $ip..."
#sshpass -p $2 ssh-copy-id -i $ssh_key_pub_path $username@$ip
sshpass -p $password ssh-copy-id -i "$ssh_keypath" $username@$ip
if [ $? -ne 0 ];
    then
        echo "ssh-copy-id error!!"
        exit 1
    else
        echo "COPYING SSHID COMPLETED"
fi


