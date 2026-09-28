 pipeline {
 environment {
 imagename = "masoodms/mask-web" // change the docker id/image name
 image_tag    = "${env.BUILD_NUMBER}" // Sets version to current Jenkins build number
 registryCredential = 'masoodms' // docker id
 dockerImage = ''
 }
 agent any
 stages {
 stage('Cloning Git') {
 steps {
 git([url: 'https://github.com/masoodmls/masood-jenkins.git', branch: 'main'])  // git repo url
 }
 }
 stage('Building image') {
 steps{
 script {
 dockerImage = docker.build imagename:${image_tag}
 }
 }
 }
 stage('Running image') {
 steps{
 script {
 sh "docker run -itd -P ${imagename}:${image_tag}"
 }
 }
 }
 stage('Deploy Image') {
 steps{
 script {
 docker.withRegistry( '', registryCredential ) {
 dockerImage.push("$BUILD_NUMBER")
 dockerImage.push("image_tag")
 }
 }
 }
 }
 }
}
