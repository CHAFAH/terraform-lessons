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
                echo "Welcome to Danske Bank"
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/CHAFAH/terraform-lessons.git'
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
                    sh 'terraform fmt'
                    sh 'terraform plan'
                }
            }
        }        
    }
}
