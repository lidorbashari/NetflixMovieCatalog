pipeline {
    agent {
        label "general"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test before build') {
            steps {
                echo 'Hello World'
            }
        }
    }
}