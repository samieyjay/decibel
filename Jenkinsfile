pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """
                git clone https://github.com/samieyjay/decibel.git 
                ./decibel/partthree/dstat.sh --no-daemon
                """
            }
        }
    }
}
        
