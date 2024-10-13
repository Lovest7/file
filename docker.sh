#!/bin/bash
# 一键安装 Docker 脚本

# 更新系统
sudo apt update && sudo apt upgrade -y

# 安装依赖
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 添加 Docker 的 GPG 密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# 添加 Docker 的 APT 源
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

# 更新软件包索引
sudo apt update

# 安装 Docker
sudo apt install -y docker-ce

# 启动 Docker 并设置为开机自启
sudo systemctl start docker && sudo systemctl enable docker

# 提示用户
echo "Docker 安装完成！"