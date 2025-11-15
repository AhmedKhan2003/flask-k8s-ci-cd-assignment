pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = "ahmedkhan2003/flask-k8s-ci-cd"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'develop',
                    url: 'https://github.com/AhmedKhan2003/flask-k8s-ci-cd-assignment'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    sh "docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                script {
                    sh """
                        kubectl set image deployment/flask-app \
                        flask-app=${IMAGE_NAME}:${BUILD_NUMBER}
                    """
                }
            }
        }
    }
}
