pipeline {
    agent {
        label "general"
    }

    environment {
        VENV_DIR = '.venv'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Set up Python venv') {
            steps {
                script {
                    echo "Setting up virtual environment..."
                    sh '''
                        python3 -m venv ${VENV_DIR}
                        . ${VENV_DIR}/bin/activate
                        pip install --upgrade pip
                        pip install -r requirements-dev.txt
                    '''
                }
            }
        }

        stage('Run Lint') {
            steps {
                script {
                    echo "Running linting with flake8..."
                    sh '''
                        . ${VENV_DIR}/bin/activate
                        flake8 .
                    '''
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    echo "Running tests with pytest..."
                    sh '''
                        . ${VENV_DIR}/bin/activate
                        pytest --maxfail=1 --disable-warnings -q
                    '''
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up virtual environment..."
            sh '''
                rm -rf ${VENV_DIR}
            '''
        }
    }
}
