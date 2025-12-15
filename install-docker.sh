#!/bin/bash

# install-docker.sh
# Installiert Docker Engine und Docker Compose (V2 Plugin) auf Ubuntu

set -e  # Skript bei Fehlern abbrechen

echo "=== Docker und Docker Compose Installation auf Ubuntu ==="

# 1. Alte Docker-Pakete entfernen (falls vorhanden)
echo "Entferne alte Docker-Pakete..."
sudo apt remove -y docker docker-engine docker.io containerd runc || true

# 2. System aktualisieren und Voraussetzungen installieren
echo "Aktualisiere Paketquellen und installiere Voraussetzungen..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg

# 3. Verzeichnis für GPG-Key anlegen
echo "Richte GPG-Key-Verzeichnis ein..."
sudo install -m 0755 -d /etc/apt/keyrings

# 4. Docker's offiziellen GPG-Key herunterladen
echo "Lade Docker GPG-Key herunter..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 5. Docker-Repository zur sources.list hinzufügen
echo "Füge Docker-Repository hinzu..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 6. Paketquellen aktualisieren
sudo apt update

# 7. Docker Engine, CLI und Compose-Plugin installieren
echo "Installiere Docker und Docker Compose Plugin..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 8. Docker-Dienst starten und beim Boot aktivieren
echo "Starte Docker-Dienst..."
sudo systemctl start docker
sudo systemctl enable docker

# 9. Aktuellen Benutzer zur docker-Gruppe hinzufügen (kein sudo mehr nötig)
echo "Füge aktuellen Benutzer zur docker-Gruppe hinzu..."
sudo usermod -aG docker $USER

# 10. Installation überprüfen
echo "=== Installation abgeschlossen ==="
echo "Docker Version:"
docker --version
echo "Docker Compose Version:"
docker compose version

echo ""
echo "Teste mit: docker run hello-world"
echo "WICHTIG: Neu einloggen oder 'newgrp docker' ausführen, damit die Gruppenänderung wirksam wird."
echo "Danach kannst du Docker-Befehle ohne sudo ausführen."

exit 0
