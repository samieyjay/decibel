pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                git branch: 'developer', url: 'https://github.com/samieyjay/decibel.git'
                sh 'echo $PWD'
            }
        }
        stage('DeployToRemoteServer') {
            when {
                branch 'developer'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'server_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'node-one',
                                sshCredentials: [
                                    username: "$USERNAME",
                                    encryptedPassphrase: "$USERPASS"
                                ], 
                                transfers: [
                                    sshTransfer(
                                        usePty: 'if [ -d "decibel" ] then rm -r /tmp/partthree else echo "Error: Directory does not exists." fi'
                                        sourceFiles: 'partthree/dstat.sh',
                                        removePrefix: 'partthree/',
                                        remoteDirectory: '/tmp',
                                        usePty: 'sudo cd /tmp && ./dstat.sh'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
    }
}
        
