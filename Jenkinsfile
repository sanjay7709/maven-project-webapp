pipeline {
    agent any
    environment {
        Path="$PATH:/usr/share/maven/bin/"
    }
    stages {
        stage ('Git checkout'){
            steps {
                git branch: "main" ,url:"https://github.com/sanjay7709/maven-project-webapp.git"
                }
            }
        stage ('Maven unit testing') {
            steps{
                script{
                    def mvnHome= tool name: 'Maven 3.6.3', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean test"
                }
            }
        }
        stage ('Intergration test') {
            steps{
                script{
                    def mvnHome= tool name: 'Maven 3.6.3', type: 'maven'
                    sh "${mvnHome}/bin/mvn verify -DskipUnitTests"
                }
            }
        }
        stage ('Maven build') {
            steps{
                script{
                    def mvnHome= tool name: 'Maven 3.6.3', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean package"
                }
            }
        } 
        stage ('sonarqube analysis') {
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'sonarqube') {
                        def mvnHome= tool name: 'Maven 3.6.3', type: 'maven'
                        sh "${mvnHome}/bin/mvn sonar:sonar"
                     }
                }
            }
        }
        stage ('sonarqube quality gate check') {
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube'
                }
                
            }
        }
        stage ('docker image build') {
            steps{
                script{
                    sh "docker build -t $JOB_NAME:v1.$BUILD_ID . "
                    sh "docker image tag $JOB_NAME:v1.$BUILD_ID sanjay7709/$JOB_NAME:v1.$BUILD_ID"
                    sh "docker image tag $JOB_NAME:v1.$BUILD_ID sanjay7709/$JOB_NAME:latest"
                }
            }
        }
        stage ('docker image push') {
            steps{
                script{
                    withCredentials([string(credentialsId: 'sanjay7709', variable: 'docker')]) {
                        sh "docker login -u sanjay7709 -p ${docker}"
                        sh "docker image push sanjay7709/$JOB_NAME:latest"
                        sh "docker image push sanjay7709/$JOB_NAME:v1.$BUILD_ID"
                    }
                }
            }
        }
    }
}
