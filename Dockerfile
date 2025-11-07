# Image de base légère avec Python
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le contenu du projet
COPY . .

# Exposer le port Flask (5000 par défaut)
EXPOSE 5000

# Lancer l'application Flask avec Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
