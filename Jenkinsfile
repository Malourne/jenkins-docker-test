node {
    def app

    stage('Clone repository') {

        checkout scm
    }
     stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('Build image') {

        app = docker.build("malourne/jenkins-docker-test")
    }

stage('Push image') {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "https://hub.docker.com/repositories/malourne" ]) {
        dockerImage.push()
        }
    } 
}
