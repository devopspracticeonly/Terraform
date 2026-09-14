pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_DIR = 'terraform'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform fmt -check'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Verify Resources') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform show'
                }
            }
        }

        stage('Terraform Destroy Plan') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform plan -destroy -out=destroy.tfplan'
                }
            }
        }

        stage('Destroy Approval') {
            steps {
                input message: 'Resource has been created and verified. Do you want to destroy it?',
                      ok: 'Destroy'
            }
        }

        stage('Terraform Destroy') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform apply -auto-approve destroy.tfplan'
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform Apply and Destroy completed successfully.'
        }

        failure {
            echo 'Terraform pipeline failed.'
        }

        always {
            cleanWs()
        }
    }
}