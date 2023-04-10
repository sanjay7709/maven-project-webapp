pipeline {
    agent any
    stages {
        stage ('Git checkout'){
            steps {
                git branch: "main" ,url:"https://github.com/sanjay7709/maven-project-webapp.git"
                }
            }
        stage ('Maven unit testing') {
            steps{
                script{
                    def mvnHome= tool name: 'Maven 3.9.1', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean test"
                }
            }
        }
        stage ('Intergration test') {
            steps{
                script{
                    def mvnHome= tool name: 'Maven 3.9.1', type: 'maven'
                    sh "${mvnHome}/bin/mvn verify -DskipUnitTests"
                }
            }
        }
        stage ('Maven build') {
            steps{
                script{
                    def mvnHome= tool name: 'Maven 3.9.1', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean package"
                }
            }
        } 
        stage ('sonarqube analysis') {
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'sonarqube') {
                        def mvnHome= tool name: 'Maven 3.9.1', type: 'maven'
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
                    sh """  docker image build -t $JOB_NAME:v1.$BUILD_ID .
                            docker image tag sanjay7709/$JOB_NAME:v1.$BUILD_ID 
                            docker image tag sanjay7709/$JOB_NAME:latest """
                }
            }
        }
    }
}
