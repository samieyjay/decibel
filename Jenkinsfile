pipeline {
    agent any
    stages {
        when {
            branch 'developer'
        }
        stage("SSH Steps Rocks!") {
            steps {
                input 'Does the staging environment look OK?'
                milestone(1)
                withCredentials([usernamePassword(credentialsId: 'server_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    writeFile file: 'abc.sh', text: 'ls'
                    sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
                    sshPut remote: remote, from: 'abc.sh', into: '.'
                    sshGet remote: remote, from: 'abc.sh', into: 'bac.sh', override: true
                    sshScript remote: remote, script: 'abc.sh'
                    sshRemove remote: remote, path: 'abc.sh'
                }
            }
        }
    }
}
