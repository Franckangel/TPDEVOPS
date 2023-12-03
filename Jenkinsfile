pipeline {
    agent any
    stages {
        stage('git checkout') {
            steps {
                git credentialsId: 'GitHubAccess', url: 'https://github.com/Franckangel/TPDEVOPS.git'
            }
        }
        stage('Build the application'){
                   steps {
                       sh 'mvn clean install'
                  }
        }
        stage('Unit Test Execution') {
            steps{
                sh 'mvn test'
            }
        }
        stage('Build the docker image') {
            steps{
                sh 'docker build -t franckangel/triang7:1.0.0 .'
                withCredentials([string(credentialsId:'dockerhubpass', variable: 'dockerHubPass')]) {
                        sh 'docker login -u franckangel -p ${dockerHubPass}'
                }
                sh 'docker push franckangel/triang7:1.0.0'
            }
            
        }
    }
}

