#!/bin/bash

# Install Docker engine and standard plugins
yay -S --needed --noconfirm docker docker-compose

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}

# Limit log size to avoid running out of disk
sudo mkdir -p /etc/docker
if [ -f /etc/docker/daemon.json ]; then
  echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /tmp/docker-log.json >/dev/null
  sudo jq -s '.[0] * .[1]' /etc/docker/daemon.json /tmp/docker-log.json | sudo tee /etc/docker/daemon.json >/dev/null
  sudo rm /tmp/docker-log.json
else
  echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json
fi

# Start and enable docker service
sudo systemctl restart docker.service
sudo systemctl enable docker.service

# Apply docker group to current session so subsequent commands work
if ! id -nG "$USER" | grep -qw docker; then
  sg docker -c "true" 2>/dev/null || true
fi
