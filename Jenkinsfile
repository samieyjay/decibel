pipeline {
    agent any
    stages {
        stage('PullScript') {
            steps {
                echo 'Fetching script from Git'
                git branch: 'developer', url: 'https://github.com/samieyjay/decibel.git'
                echo $PWD
            }
        }
        stage('ExecOnRemoteServer') {
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
                                        remoteDirectory: '/tmp',
                                        execCommand: 'sudo sh /tmp/partthree/dstat.sh && rm -r /tmp/partthree'
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
        
