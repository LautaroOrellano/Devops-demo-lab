#!/bin/bash
set -e

echo "Updating system..."
apt-get update -y

echo "Installing dependencies..."
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  git

echo "Installing Docker..."
curl -fsSL https://get.docker.com | sh
usermod -aG docker ubuntu
systemctl enable docker
systemctl start docker

echo "Installing Google Cloud SDK..."
curl -sSL https://sdk.cloud.google.com | bash
export PATH=$PATH:/root/google-cloud-sdk/bin

echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

echo "Bootstrap completed"