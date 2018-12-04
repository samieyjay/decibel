pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh """
                if [ -d "decibel" ]
                then
                    rm -r decibel
                else
                    echo "Error: Directory /path/to/dir does not exists."
                fi
                git clone https://github.com/samieyjay/decibel.git
                """
            }
        }
        stage('Get file from Git') {
            steps {
                sh "git archive --remote=${https://github.com/samieyjay/decibel.git} --format=tar ${developer} ${partthree/dstat.sh} | tar xf -"
            }
        }
    }
}
        
