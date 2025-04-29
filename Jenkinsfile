pipeline {
    agent any
    environment {
        SONAR_TOKEN = credentials('sonar-token') // Ensure this matches your Jenkins credentials
    }
    tools {
        sonarScanner 'SonarQubeScanner' // Make sure this is defined in your Global Tool Configuration
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Aryanfour5/twiiter_sent_Analysis.git'
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
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }
    }
}
