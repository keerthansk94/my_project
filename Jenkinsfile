pipeline {
    agent any

    tools{
        maven "my_maven"
    }

    stages {
        stage("compile"){
            steps{
                echo "project compile"
                sh "mvn compile"
            }
        }
        stage('UnitTest') { 
          agent any
            steps {
                echo "Test the code"
                sh "mvn test"
            }
            post{
                always{
                     junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage("test"){
            steps{
                echo "project code review"
                echo "project test coverage analysis package"
                sh "mvn clean package"
            }
        }
        stage("build a docker image and run the container"){
            steps{
                sh "chmod +x script.sh && bash script.sh"
                sh "docker build -t app:v${BUILD_NUMBER} ."
                sh "docker rm -f app_run || true"
                sh "docker run -itd --name app_run -P app:v${BUILD_NUMBER}"
            }
        }
    }
}
