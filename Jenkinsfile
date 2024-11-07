pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        AWS_CREDENTIALS = credentials('ACCESS_KEYS')
    }

    stages {
        stage('GIT CHECKOUT') {
            steps {
                git branch: 'main', url: 'https://github.com/HILL-TOPCONSULTANCY/terraform-iac-repo.git'
                echo 'Repository clonned successfully'
            }
        }
        stage('TERRAFORM INIT') {
            steps {
                dir('2-Using Profiles') {
                    sh 'terraform init'
                    echo 'initialized successfuly'
                }
            }
        }
        stage('TERRAFORM PLAN') {
            steps {
                dir('2-Using Profiles') {
                    sh 'terraform plan'
                }
            }
        }
        stage('TERRAFORM APPLY') {
            steps {
                dir('2-Using Profiles') {
                    echo 'destroying resources'
                    sh 'terraform destroy --auto-approve'
                }
            }
        }
    }
}
