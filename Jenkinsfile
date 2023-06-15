pipeline {
    agent any
    tools {
        maven 'MyMaven'
    }
    stages {
        stage ('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sathiiz/XYZ_Technologies.git'
            }
        }
        
        stage ('Complie Code') {
            steps {
                sh 'mvn compile'
        }
        }

        stage ('Test Code') {
            steps {
                sh 'mvn test'
        }
        }

        stage ('Package Code') {
            steps {
                sh 'mvn clean package'
                sh 'mvn clean install'
        }
        }
    }
}
