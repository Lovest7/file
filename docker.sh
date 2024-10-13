#!/bin/bash

# 更新软件包索引
echo "Updating package index..."
sudo apt update

# 安装必要的工具
echo "Installing necessary packages..."
sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

# 添加 Docker 的 GPG 密钥
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

# 添加 Docker 的官方软件源
echo "Adding Docker's official repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新软件包索引
echo "Updating package index again..."
sudo apt update

# 安装 Docker
echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# 启动 Docker 服务
echo "Starting Docker service..."
sudo systemctl start docker

# 设置 Docker 服务开机自启
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

# 检查 Docker 状态
echo "Checking Docker status..."
sudo systemctl status docker

echo "Docker installation completed!"
