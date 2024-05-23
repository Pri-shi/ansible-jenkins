pipeline {
    agent any

    parameters {
        string(name: 'IPs', description: 'Enter a comma-separated list of IP addresses', defaultValue: '', trim: true)
    }

    stages {
        stage('SSH') {
            steps {
                script {
                     def ipList = params.IPs.split(',')
                    sh '''
                    chmod +x script.sh
                    '''
                    for (int i = 0; i < ipList.size(); i++) {
                        def ipAddress = ipList[i].trim()
                        withCredentials([usernamePassword(credentialsId: "${ipAddress}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        // script to SSH copy id to the remote server
                        sh """
                        ./script.sh ${USERNAME} ${PASSWORD} ${ipAddress}
                        """
                        }
                    }
                }
            }
        }
        stage('Dynamic Inventory') {
            steps{
                script{
                    // Split the comma-separated list of IPs into an array
                    def ipList = params.IPs.split(',')

                    // Create a dynamic inventory file
                    def inventoryContent = "[targets]\n"
                    ipList.each { ip ->
                        inventoryContent += "${ip} \n"
                    }
                    
                    writeFile file: 'dynamic_inventory', text: inventoryContent
                }
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                script {
                    // sh '''
                    // cat ./ansible/role/playbook1.yaml
                    // cat dynamic_inventory
                    // ansible-playbook -i dynamic_inventory ./ansible/role/playbook1.yaml'''
                
                    sh '''
                        ansible-playbook -i dynamic_inventory ./ansible/role/playbook3.yaml
                        ansible-playbook -i dynamic_inventory ./ansible/role/playbook4.yaml
                    '''
                }
            }
        }
    }
}
