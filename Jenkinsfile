pipeline {
    agent any
    
    environment {
        GRAFANA_URL = "http://192.168.1.253:3000"
        INFLUXDB_SERVER_IP = "192.168.1.253"
        INFLUXDB_DATABASE = "tekno-pathshala"
        INFLUXDB_USER = "tekno"
        INFLUXDB_PASSWORD = "password@12"
    }
    
    stages {
        stage('Setup TIG Stack') {
            steps {
                script {
                    docker.image('ubuntu').inside {
                        sh 'bash setup_script.sh'
                    }
                }
            }
        }
        stage('Configure Grafana API Key') {
            steps {
                script {
                    GRAFANA_API_KEY = sh(script: '''
                        response=$(curl -X POST "${GRAFANA_URL}/api/auth/keys" --user admin:admin -d '{"name":"Jenkins Key","role":"Admin"}' -H "Content-Type: application/json")
                        echo $response | grep -o '"key":"[^"]*' | cut -d'"' -f4
                    ''', returnStdout: true).trim()
                }
            }
        }
        stage('Configure Grafana Data Source') {
            steps {
                sh 'bash grafana_datasource_setup.sh'
            }
        }
        stage('Security Configuration') {
            steps {
                sh 'bash security_setup.sh'
            }
        }
    }
}
