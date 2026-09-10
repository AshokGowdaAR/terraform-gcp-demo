pipeline {
    agent any

    environment {
        PROJECT_ID = 'my-project-jenkins-508011'
    }

    stages {
        stage('Terraform Format Check') {
            steps {
                // Checks if files follow standard formatting. Fails the build if unformatted.
                sh 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                // Validates syntax and internal consistency of module references
                sh 'terraform validate'
            }
        }

        stage('TFSec Security Scan') {
            steps {
                // Scans Terraform code for security vulnerabilities and misconfigurations
                // Note: '|| true' keeps the build from failing if tfsec finds warnings, 
                // remove '|| true' if you want non-compliant security builds to fail immediately.
                sh 'tfsec . || true'
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
