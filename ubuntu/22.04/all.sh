#!/bin/bash

####################################################
# Configura todo ambiente
####################################################

# Atualiza Sistema
sudo apt update
sudo apt upgrade -y

# Configura GIT
sh ./git.sh "Rodrigo Eleuterio" "roeleuss@gmail.com"

# Instala Docker
sh ./docker.sh
