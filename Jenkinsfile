pipeline {
    agent any

    parameters {
        string(name: 'IPs', description: 'Enter a comma-separated list of IP addresses', defaultValue: '', trim: true)
    }

    stages {
        stage('Create Inventory') {
            steps {
                script {
                     def ipList = params.IPs.split(',')
                     def ipListPass= params.IPs.split(',')

                    chmod +x script.sh
                    for (int i = 0; i < ipAddresses.size(); i++) {
                        def ipAddress = ipAddresses[i].trim()
                        withCredentials([usernamePassword(credentialsId: ${ipAddress}, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        // script to SSH copy id to the remote server
                        sh """
                        ./script.sh ${USERNAME} ${PASSWORD} ${ipAddress}
                        """
                        }
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
