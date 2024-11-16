pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        AWS_CREDS = credentials('AWS_CREDENTIALS')
    }

    stages {
        stage('CLONE GIT REPOSITORY') {
            steps {
                echo "starting jenkins pipeline"
                git branch: 'main', url: 'https://github.com/CHAFAH/terraform-lessons.git'
            }
        }
        stage('TERRAFORM INIT') {
            steps {
                dir('2-Using Profiles') {
                    sh 'terraform init'
                }
            }
        }
        stage('TERRAFORM PLAN') {
            steps {
                dir('2-Using Profiles') {
                    sh 'terraform validate'
                    sh 'terraform plan'
                }
            }
        }        
    }
}
