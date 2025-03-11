// pipelines/build.Jenkinsfile

pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Build app container') {
            steps {
                sh '''
                    ls
                    echo hi lidor
                    # build an image
                    docker build -t netflix-front .
                '''
            }
        }
    }
}