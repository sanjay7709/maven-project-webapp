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
                    def mvnHome= tool name: 'Apache Maven 3.9.1', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean test"
                }
            }
        }
//         stage ('Intergration test') {
//             steps{
//                 sh 'mvn verify -DskipUnitTests'
//         stage ('Maven unit testing') {
//             steps{
//                 sh 'mvn clean test'
//             }
//         }
//         stage ('Intergration test') {
//             steps{
//                 sh 'mvn verify -DskipUnitTests'
            
//             }
//         }
//         stage ('maven build') {
//             steps{
//                 sh 'mvn clean package'
//             }
//         }
//         //install plugins on jenkins (sonarqube-scanner, sonarqube gerrit, quality gate plugin)
// // secret text ---> given the Token from sonar qube
//         stage ('Sonaqube code review') {
//             steps{
//                 withSonarQubeEnv('sonarqube'){
//                     sh 'mvn sonar:sonar'
//                 }
//             }
//         }
// // sonarqube-webhook configuration
// //goto config -> webhooks--> enter jenkins url /sonarqube-webhook 
//         stage ('quality gate analysis') {
//             steps{
//                     waitForQualityGate abortPipeline: true
//                 }
//             }
//         }
// // store artifacts in Nexus repository 
// // plugin name -- pipeline utility steps
//         stage ('upload artifact to nexus') {
//             steps{
//                 script{
//                     def readPom= readMavenPom file: 'pom.xml'
//                     def nexusRepo= readPom.version.endswith('SNAPSHOT') ? "<snapshot-repo-name>" : "<release-repo-name>"
//             }
//         }
//         stage ('maven build') {
//             steps{
//                 sh 'mvn clean package'
//             }
//         }
//         //install plugins on jenkins (sonarqube-scanner, sonarqube gerrit, quality gate plugin)
// // secret text ---> given the Token from sonar qube
//         stage ('Sonaqube code review') {
//             steps{
//                 withSonarQubeEnv('sonarqube'){
//                     sh 'mvn sonar:sonar'
//                 }
//             }
//         }
// // sonarqube-webhook configuration
// //goto config -> webhooks--> enter jenkins url /sonarqube-webhook 
//         stage ('quality gate analysis') {
//             steps{
//                     waitForQualityGate abortPipeline: true
//                 }
//             }
//         }
// // store artifacts in Nexus repository 
// // plugin name -- pipeline utility steps
//         stage ('upload artifact to nexus') {
//             steps{
//                 script{
//                     def readPom= readMavenPom file: 'pom.xml'
//                     def nexusRepo= readPom.version.endswith('SNAPSHOT') ? "<snapshot-repo-name>" : "<release-repo-name>"

//                 }
//                 }
//             }
//         }
// // make sure docker is installed on jenkins 
//         stage ('Docker build image') {
//             steps{
//                 script{
//                     sh "docker image build -t $JOB_NAME:v1.$BUILD_ID ."
//                     sh "docker image tag <docker-username>/$JOB_NAME:v1.$BUILD_ID"
//                     sh "docker image tag <docker-username>/$JOB_NAME:latest"
//                 }
//                 }
//             }
//         }
// // withcredentials:bindcredentials to variables
//         stage ('Docker push image') {
//             steps{
//                 script{
//                     sh """
//                         docker login -u <username> -p <password>
//                         docker push image <docker-username>/$JOB_NAME:latest
//                         docker push image <docker-username>/$JOB_NAME:v1.$BUILD_ID
//                         """
//                 }
//                 }
//             }
//         }
    }
}
