pipeline {
    agent any

      tools {
        jdk 'JDK11'
    }

    environment {
        IMAGE_NAME = "hello-java-app"
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Java App') {
            steps {
                bat 'javac app.java'
                bat 'jar cfe app.jar app app.class'
            }
        }

        stage('Docker Build') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                bat "docker rm -f hello-container || echo Container not found"
                bat "docker run -d --name hello-container %IMAGE_NAME%:%IMAGE_TAG%"
            }
        }
    }

    post {
        success {
            echo "Application built, dockerized, and running successfully!"
        }
        failure {
            echo "Build or deployment failed. Check logs."
        }
    }
}
