#!/bin/bash

####################################################
# Instala docker no ubuntu22.04 (wsl2)
####################################################

## Instala dependências
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

## Adiciona repositório
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

## Instala docker
sudo apt install -y docker-ce

## Adiciona o usuário ao grupo docker
sudo usermod -a -G docker $USER

## Remove requisição de senha ao iniciar serviço docker
sh ./sudoers.sh "$USER ALL=(ALL) NOPASSWD: /usr/bin/dockerd"

## Configuração para iniciar serviço do docker ao iniciar WSL
echo '# Start Docker daemon automatically when logging in if not running.' >> ~/.bashrc
echo 'RUNNING=`ps aux | grep dockerd | grep -v grep`' >> ~/.bashrc
echo 'if [ -z "$RUNNING" ]; then' >> ~/.bashrc
echo '    sudo dockerd > /dev/null 2>&1 &' >> ~/.bashrc
echo '    disown' >> ~/.bashrc
echo 'fi' >> ~/.bashrc

## Set iptables para legacy mode (senão docker não inicia no Ubuntu-22.04)
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy