#!/bin/bash

sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update#!/bin/bash

# Install Docker
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Configure Docker authentication for Artifact Registry
gcloud auth configure-docker europe-north2-docker.pkg.dev --quiet

# Create directory for docker compose
mkdir -p /home/$USER/monitoring
cd /home/$USER/monitoring

# # Create docker-compose.yml
# cat > docker-compose.yml <<'EOF'
# volumes:
#   prom:
#   grafana-data:

# services:

#   node-exporter:
#     image: europe-north2-docker.pkg.dev/build-project-476008/monitoring/node:latest
#     container_name: node-exporter
#     restart: unless-stopped
#     ports:
#       - "9100:9100"
#     networks:
#       - monitoring

#   prometheus:
#     image: europe-north2-docker.pkg.dev/build-project-476008/monitoring/prom:latest
#     container_name: prometheus
#     restart: unless-stopped
#     ports:
#       - "9090:9090"
#     volumes:
#       - prom:/prometheus
#     networks:
#       - monitoring
#     depends_on:
#       - node-exporter

#   grafana:
#     image: europe-north2-docker.pkg.dev/build-project-476008/monitoring/graf:latest
#     container_name: grafana
#     restart: unless-stopped
#     ports:
#       - "3000:3000"
#     volumes:
#       - grafana-data:/var/lib/grafana
#     networks:
#       - monitoring
#     depends_on:
#       - prometheus

# networks:
#   monitoring:
#     driver: bridge
# EOF
