pipeline {
    agent any

    environment {
        PROJECT_ID = 'my-project-jenkins-508011'
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var="project_id=${PROJECT_ID}"'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var="project_id=${PROJECT_ID}"'
            }
        }
    }
}