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
        sh 'echo dckr_pat_x38sM_6dBsc476DciOJ9AAun-W0 | docker login -u malourne --password-stdin'
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
