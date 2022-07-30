#!/bin/bash

####################################################
# Instala docker no ubuntu20.04 (wsl2)
####################################################

## Instala dependências
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

## Adiciona repositório
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

## Instala docker
sudo apt install -y docker-ce

## Inicia o serviço
sudo service docker start

## Adiciona o usuário ao grupo docker e faz logout para fazer efeito.
sudo usermod -a -G docker $USER

## Ativa recurso para salvar credential
git config --global credential.helper store
