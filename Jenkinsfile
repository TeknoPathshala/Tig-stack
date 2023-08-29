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
                    GRAFANA_API_KEY = generateGrafanaAPIKey()
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

def generateGrafanaAPIKey() {
    // Logic to generate the API key
    def apiKey = sh(script: "echo 'logic_to_generate_key'", returnStdout: true).trim()
    return apiKey
}
