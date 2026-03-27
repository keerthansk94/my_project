pipeline {
    agent any

    tools{
        maven "my_maven"
    }

    stages {
        stage("compile")
            steps{
                echo "project compile"
                sh "mvn compile"
            }
        }
        stage("test"){
            steps{
                echo "project code review"
                echo "project test coverage analysis package"
                sh "mvn clean package"
            }
        }
    }
}