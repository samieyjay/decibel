pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """

                git url https://github.com/samieyjay/decibel.git
                """
            }
        }
    }
}
        
