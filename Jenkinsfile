pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonar-token') // Ensure this matches your Jenkins credential ID
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Aryanfour5/twiiter_sent_Analysis.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') { // Must match the name in "Manage Jenkins > Configure System"
                    sh '''
                        sonar-scanner \
                          -Dsonar.projectKey=TwitterSentiment \
                          -Dsonar.sources=. \
                          -Dsonar.host.url=http://localhost:9000 \
                          -Dsonar.login=$SONAR_TOKEN
                    '''
                }
            }
        }
    }
}
