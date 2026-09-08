pipeline {
    agent any

    environment {
        PROJECT_ID = 'my-project-jenkins-508011'
    }

    stages {
        stage('Checkout') {
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
                sh 'terraform plan -var="project_id=${my-project-jenkins-508011}"'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var="project_id=${my-project-jenkins-508011}"'
            }
        }
    }
}
