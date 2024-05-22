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

                        // Join the IP list into a space-separated string to pass as arguments
                        def ipArgs = ipList.join(' ')

                        // Run the shell script with the IP addresses as input arguments
                        sh """
                        chmod +x script.sh
                        ./script.sh ${ipArgs}
                        """
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
