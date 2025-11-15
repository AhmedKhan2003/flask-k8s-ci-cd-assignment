pipeline {
    agent any

    environment {
        DOCKERHUB_USER = credentials('dockerhub')
        IMAGE_NAME = "ahmedkhan023/flask-k8s-ci-cd"
        TAG = "v3"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'develop', url: 'https://github.com/AhmedKhan2003/flask-k8s-ci-cd-assignment'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_USER_PSW | docker login -u $DOCKERHUB_USER_USR --password-stdin'
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment.yaml'
                sh 'kubectl apply -f kubernetes/service.yaml'
            }
        }
    }
}
