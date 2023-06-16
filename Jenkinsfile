pipeline {
    agent {
        label 'edureka'
    }
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
    }
}
