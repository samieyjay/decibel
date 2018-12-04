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
    }
}
        
