pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """
                if [ -d folder ]; then rm -rf folder; fi
                git clone https://github.com/samieyjay/decibel.git
                """
            }
        }
    }
}
        
