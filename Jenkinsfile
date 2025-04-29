pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonar-token') // This must match the ID in Jenkins Credentials
    }

    tools {
        sonarScanner 'SonarQubeScanner' // This must match the tool name in "Global Tool Configuration"
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
                withSonarQubeEnv('SonarQube') { // Match this to the name configured under "SonarQube servers"
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
