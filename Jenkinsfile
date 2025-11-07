pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                git 'https://github.com/DelliaBiloa/Devops.git'
            }
        }

        stage('Installer les dépendances') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Tester l’application') {
            steps {
                sh 'python -m unittest discover tests || true'
            }
        }

        stage('Déployer') {
            steps {
                // Exemple 1 : lancer Flask en local
                sh 'nohup python3 app.py &'
                
                // Exemple 2 : ou déployer via Docker
                // sh 'docker build -t flaskapp:latest .'
                // sh 'docker run -d -p 5000:5000 flaskapp:latest'
            }
        }
    }

    post {
        success {
            slackSend channel: '#appli', message: "✅ Déploiement réussi de Flask sur Jenkins !"
        }
        failure {
            slackSend channel: '#appli', message: "❌ Échec du déploiement Flask."
        }
    }
}
