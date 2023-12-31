pipeline {
    agent any
        
    tools {
        maven 'MyMaven'
    }
    stages {      
        stage ('1.Complie Code') {
            steps {
                sh 'mvn compile'
        }
        }
        stage ('2.Test Code') {
            steps {
                sh 'mvn test'
        }
            post{
            success{
                junit 'target/surefire-reports/*.xml'
            }
        }
        }
        stage ('3.Package Code') {
            steps {
                sh 'mvn clean package'
                sh 'mvn clean install'
        }
        }
        stage ('4.Build and Push Docker Image') {
            steps {
                sh 'docker build -t sathiz/$JOB_NAME:$BUILD_NUMBER .'            
            withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'Docker_pwd', usernameVariable: 'Docker_ID')]) {
                sh "echo '${Docker_pwd}' | docker login -u ${Docker_ID} --password-stdin"
            }
                sh 'docker push sathiz/$JOB_NAME:$BUILD_NUMBER'
            }
        }
        stage ('5. Run Ansible Playbook : Deployment to Test Env') {
            steps {
                ansiblePlaybook become: true, credentialsId: 'jenkinsUsr_PrivateKey', disableHostKeyChecking: true, installation: 'MyAnsible', inventory: 'hosts', playbook: 'ansible.yaml', extras: '-e JOB_NAME=${JOB_NAME} -e BUILD_NUMBER=${BUILD_NUMBER}'
                // sh 'kubectl set image deployments/xyz-tech-frontend xyz-tech=sathiz/${JOB_NAME}:${BUILD_NUMBER}'
                // sh 'sed -i "s/${JOB_NAME}/g" deployment.yaml'
                // sh 'sed -i "s/${BUILD_NUMBER}/g" deployment.yaml'
            }
        }
    }
}
