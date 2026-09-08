pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'feature-jenkins', url: 'https://github.com/AshokGowdaAR/terraform-gcp-demo.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
