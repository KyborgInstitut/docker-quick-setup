# Docker und Docker Compose Installationsskript für Ubuntu

Dieses Repository enthält ein einfaches Bash-Skript (`install-docker.sh`), das Docker Engine und das offizielle Docker Compose Plugin (V2, Befehl: `docker compose`) auf einem frischen Ubuntu-System installiert.

Das Skript folgt exakt der [offiziellen Docker-Dokumentation](https://docs.docker.com/engine/install/ubuntu/) und ist für Ubuntu 22.04, 24.04 und neuere Versionen geeignet.

## Verwendung (ohne GitHub-Konto – direkter Download via curl)

```bash
# Skript herunterladen
curl -fsSL https://raw.githubusercontent.com/kyborginstitut/docker-quick-setup/main/install-docker.sh -o install-docker.sh

# Ausführbar machen
chmod +x install-docker.sh

# Mit sudo ausführen
sudo ./install-docker.sh
```

Wichtig nach der Installation:

Neu einloggen (oder newgrp docker in der aktuellen Shell ausführen), damit du Docker-Befehle ohne sudo nutzen kannst.
Testen: docker run hello-world

Alternativ (direkt ausführen, ohne Download – für schnelle Tests):

```bash
curl -fsSL https://raw.githubusercontent.com/kyborginstitut/docker-quick-setup/main/install-docker.sh | sudo bash
```

Was das Skript macht

Entfernt alte Docker-Installationen (falls vorhanden)
Aktualisiert das System und installiert Voraussetzungen
Fügt den offiziellen Docker GPG-Key und Repository hinzu
Installiert docker-ce, docker-ce-cli, containerd.io, docker-buildx-plugin und docker-compose-plugin
Startet und aktiviert den Docker-Dienst
Fügt den aktuellen Benutzer zur docker-Gruppe hinzu

Hinweise

Das Skript ist idempotent und kann mehrmals ausgeführt werden.
Für Produktionsumgebungen empfehlt Docker die manuelle Installation über das Repository (siehe offizielle Docs).
Immer Skripte aus dem Internet vor der Ausführung prüfen!
