pipeline {
    agent any
    environment {
        SONAR_TOKEN = credentials('sonar-token') // store in Jenkins credentials
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Aryanfour5/twiiter_sent_Analysis.git'
            }
        }

        stage('Install Dependencies') {
            steps {
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
