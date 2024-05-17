pipeline {
    agent any

    parameters {
        string(name: 'IPs', description: 'Enter a comma-separated list of IP addresses', defaultValue: '', trim: true)
    }

    stages {
        stage('Create Inventory') {
            steps {
                withCredentials([usernamePassword(credentialsId: '172.17.0.3', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    script {
                    pwd 
                    whoami
                    ls
                    // Split the comma-separated list of IPs into an array
                    def ipList = params.IPs.split(',')

                    // Create a dynamic inventory file
                    def inventoryContent = "[targets]\n"
                    ipList.each { ip ->
                        inventoryContent += "${ip} ansible_connection=ssh ansible_ssh_user=${USERNAME} ansible_ssh_pass=${PASSWORD}\n"
                    }
                    
                    writeFile file: 'dynamic_inventory', text: inventoryContent
                }
                }
            }
        }

        // stage('Run Ansible Playbook') {
        //     steps {
        //         script {
        //             sh '''
        //             cat playbook1.yaml
        //             cat dynamic_inventory
        //             ansible-playbook -i dynamic_inventory playbook1.yaml'''
        //         }
        //     }
        // }
    }
}
