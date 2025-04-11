pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'piyush7771/node:latest'
    }

    stages {
        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Pull Image') {
            steps {
                sh 'docker pull $DOCKER_IMAGE'
            }
        }
        stage('cloning the repo data') {
            steps{
                sh 'git clone https://github.com/sharma987piyush/server-test.git'
            }
        }
        stage('build an contaioner'){
            steps{
                dir('/var/lib/jenkins/workspace/cicd/server-test'){
                    sh 'docker run -d --name react piyush7771/node:latest'
                }
            }
        }
        stage('Deploy to K3s') {
            steps {
                dir('/var/lib/jenkins/workspace/cicd/server-test'){
                    sh 'kubectl apply -f deploy.yml'
                }
            }
        }
        stage('service to k3s') {
            steps{
                dir ('/var/lib/jenkins/workspace/cicd/server-test') {
                    sh 'kubectl apply -f service.yml'
                }
            }
        }
    }
}
