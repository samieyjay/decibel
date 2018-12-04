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
                                configName: 'staging',
                                sshCredentials: [
                                    username: "$USERNAME",
                                    encryptedPassphrase: "$USERPASS"
                                ], 
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'partthree/dstat.sh',
                                        remoteDirectory: '/tmp',
                                        execCommand: 'sudo cd /tmp && ./dstat'
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
        
