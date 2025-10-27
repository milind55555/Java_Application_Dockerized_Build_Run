pipeline {
    agent any

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
                sh 'javac app.java'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker rm -f hello-container || true"
                    sh "docker run -d --name hello-container ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }

    post {
        success {
            echo "Application has been built, dockerized, and is now running!"
        }
        failure {
            echo "Build or deployment failed."
        }
    }
}
x