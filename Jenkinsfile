pipeline {
    agent any

    stages {
        stage('Changing File Permission') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('Executing Build Script') {
            steps {
                sh './build.sh'
            }
        }
    }

    post {
        success {
            sh '''
            echo "$(date '+%Y-%m-%d %H:%M:%S') Deployment Successful" >> /home/ubuntu/devops_project/deployment_monitor/data/deployment.log
            '''
        }

        failure {
            sh '''
            echo "$(date '+%Y-%m-%d %H:%M:%S') Deployment Failed" >> /home/ubuntu/devops_project/deployment_monitor/data/deployment.log
            '''
        }
    }
}
