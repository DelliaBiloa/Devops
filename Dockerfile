# Dockerfile simple pour Ubuntu
FROM ubuntu:22.04

# Installer Git et curl
RUN apt-get update && apt-get install -y git curl

# Copier le projet dans le conteneur
COPY . /app
WORKDIR /app

# Commande par défaut
CMD ["bash"]
