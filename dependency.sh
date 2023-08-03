#!/bin/bash

function print_message() {
    echo "[INFO] $1"
}

function print_error() {
    echo "[ERROR] $1"
}

function install_package() {
    package_name="$1"
    print_message "Installing $package_name..."
    sudo yum install -y "$package_name"
    if [ $? -eq 0 ]; then
        print_message "$package_name installed successfully."
    else
        print_error "Failed to install $package_name. Exiting..."
        exit 1
    fi
}

function start_service() {
    service_name="$1"
    print_message "Starting $service_name..."
    sudo systemctl start "$service_name"
    sudo systemctl enable "$service_name"
    if [ $? -eq 0 ]; then
        print_message "$service_name started and enabled successfully."
    else
        print_error "Failed to start $service_name. Exiting..."
        exit 1
    fi
}

# Install yum-utils
install_package "yum-utils"

# Add HashiCorp repository for Terraform
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# Install Terraform
install_package "terraform"

# Install Docker
install_package "docker"

# Start and enable Docker service
start_service "docker"

# Add ec2-user to the docker group
print_message "Adding ec2-user to the docker group..."
sudo usermod -aG docker ec2-user
print_message "ec2-user added to the docker group."

# Install Helm
print_message "Installing Helm..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
print_message "Helm installed successfully."

# Install kubectl
print_message "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
print_message "kubectl installed successfully."

# Install nvm and Node.js LTS
print_message "Installing nvm and Node.js LTS..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 16
print_message "Node.js LTS installed successfully."

# Install AWS CLI
install_package "awscli"

print_message "All installations completed successfully!"
