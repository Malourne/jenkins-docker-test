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

    stage('Login') {
      steps {
        sh 'echo dockerHub | docker login -u dockerHub --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push malourne/jenkins-docker-test'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
    }
}
