pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """
                git clone https://github.com/samieyjay/decibel/tree/developer/partthree.git
                ./dstat.sh --no-daemon'
                """
            }
        }
    }
}
        
