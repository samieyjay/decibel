pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """
                rm -r decibel
                git clone https://github.com/samieyjay/decibel.git
                """
            }
        }
    }
}
        
