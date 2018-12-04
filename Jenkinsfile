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
                                        sourceFiles: 'partthree/dstat.sh',
                                        removePrefix: 'partthree/',
                                        remoteDirectory: '/tmp',
                                        execCommand: 'sudo usr/bin/systemctl stop nginx && cd /tmp && ./dstat.sh && sudo usr/bin/systemctl start nginx'
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
        
