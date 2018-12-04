pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """
                if [ -d "/path/to/dir" ] 
                else
                    rm -r decibel
                fi
                git clone https://github.com/samieyjay/decibel.git
                """
            }
        }
    }
}
        
