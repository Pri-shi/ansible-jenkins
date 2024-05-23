
#!/bin/bash


ssh_keypath='/var/jenkins_home/.ssh/id_rsa'
ssh_key_path='~/.ssh/id_rsa'
echo $ssh_key_path

# echo "STARTING ssh-keygen "
# #ssh-keygen -t rsa -f $ssh_key_path -N ''
# ssh-keygen -t rsa -N '' -r $ip -f $ssh_keypath
# if [ $? -ne 0 ];
#     then
#         echo "ssh-keygen error!!"
#         exit 1
#     else
#         echo "keygen COMPLETED"
# fi



options=""
for ip in $@; do
    options="$options -r $ip"
done

# Run ssh-keygen command
echo ssh-keygen -t rsa -N '' ${options} -f "${ssh_keypath}"
ssh-keygen -t rsa -N '' $options -f "$ssh_keypath"
