pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """
                if [ -d "/path/to/dir" ]
                then
                    rm -r decibel
                else
                    echo "Error: Directory /path/to/dir does not exists."
                fi
                git clone https://github.com/samieyjay/decibel.git
                """
            }
        }
    }
}
        
