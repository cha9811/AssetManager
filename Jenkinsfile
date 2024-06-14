pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Git 저장소에서 소스 코드를 체크아웃
                git url: 'https://github.com/cha9811/AssetManager.git'
            }
        }
        stage('Build') {
            steps {
                // Maven을 사용하여 프로젝트 빌드
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Docker 이미지를 빌드
                    dockerImage = docker.build("assetmanager:${env.BUILD_ID}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Docker 이미지를 로컬 레지스트리에 푸시
                    docker.withRegistry('', '') {
                        dockerImage.push("${env.BUILD_ID}")
                        dockerImage.push("latest")
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // 원격 서버에 SSH로 접속하여 Docker 이미지를 Pull 하고 컨테이너를 재배포
                    sshagent(['deploy-ssh-credentials-id']) {
                        sh """
                        ssh ubuntu@ip-172-31-32-200 << EOF
                        docker stop assetmanager || true
                        docker rm assetmanager || true
                        docker pull assetmanager:latest
                        docker run -d --name assetmanager -p 8081:8080 assetmanager:latest
                        EOF
                        """
                    }
                }
            }
        }
    }
}
