pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                git branch: 'main', url: 'https://github.com/DelliaBiloa/Devops.git'
            }
        }

        stage('Installer les dépendances') {
            steps {
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Tester l’application') {
            steps {
                sh 'python3 -m unittest discover tests || true'
            }
        }

        stage('Déployer') {
            steps {
                sh 'nohup python3 app.py &'
            }
        }
    }

    post {
        success {
            slackSend channel: '#general', message: "✅ Déploiement réussi de Flask sur Jenkins !"
        }
        failure {
            slackSend channel: '#general', message: "❌ Échec du déploiement Flask."
        }
    }
}
