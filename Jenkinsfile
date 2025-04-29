pipeline {
    agent any
    environment {
        SONAR_TOKEN = credentials('sonar-token') // Ensure this matches your Jenkins credentials
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Aryanfour5/twiiter_sent_Analysis.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Assuming Python and pip are already installed
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run SonarQube Analysis') {
            steps {
                script {
                    // Run SonarQube analysis using the SonarQube Scanner
                    withSonarQubeEnv('SonarQube') {
                        sh 'sonar-scanner -Dsonar.login=$SONAR_TOKEN'
                    }
                }
            }
        }
    }
}
