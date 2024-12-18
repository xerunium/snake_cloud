#!/bin/bash

# Met à jour les paquets et corrige les problèmes potentiels avec dpkg
echo "Mise à jour des paquets..."
sudo apt-get update && sudo apt-get upgrade -y
sudo dpkg --configure -a

# Installe Docker (évite les doublons entre apt et snap)
echo "Installation de Docker via apt..."
sudo apt-get install -y docker.io

# Vérifie si Docker est installé correctement
if ! command -v docker &> /dev/null; then
    echo "Docker n'a pas pu être installé avec apt. Tentative via snap..."
    sudo snap install docker
fi

# Télécharge et exécute l'image Docker Snake
echo "Téléchargement de l'image Docker Snake..."
docker pull aschil/snake

echo "Lancement du conteneur Snake..."
docker run -d -p 8080:8080 aschil/snake

echo "Snake est maintenant disponible sur http://localhost:8080"
