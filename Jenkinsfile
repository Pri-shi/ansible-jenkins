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
                    sh '''
                    chmod +x script.sh
                    '''
                    for (int i = 0; i < ipList.size(); i++) {
                        def ipAddress = ipList[i].trim()
                        withCredentials([usernamePassword(credentialsId: '172.17.0.4', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        // script to SSH copy id to the remote server
                        sh """
                        ./script.sh ${USERNAME} ${PASSWORD} '172.17.0.4'
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
