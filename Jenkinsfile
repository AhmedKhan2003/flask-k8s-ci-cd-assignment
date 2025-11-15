pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = "ahmedkhan023/flask-k8s-ci-cd""
        TAG = "latest"
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
                bat """
                docker build -t %IMAGE_NAME%:%TAG% .
                """
            }
        }

        stage('Login to DockerHub') {
            steps {
                bat """
                docker login -u %DOCKERHUB_CREDENTIALS_USR% -p %DOCKERHUB_CREDENTIALS_PSW%
                """
            }
        }

        stage('Push to DockerHub') {
            steps {
                bat """
                docker push %IMAGE_NAME%:%TAG%
                """
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                bat """
                kubectl set image deployment/flask-app flask-container=%IMAGE_NAME%:%TAG% --namespace=default
                """
            }
        }
    }
}
