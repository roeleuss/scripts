#!/bin/bash

####################################################
# Adiciona um nova linha no arquivo sudoers
# Fonte original: https://gist.github.com/buchireddy/19eb6593f692852d2df7
####################################################

# Cria um backup de sudoers
sudo cp /etc/sudoers /tmp/sudoers.bak

# Inclui nova linha no arquivo backup de sudoers
sudo chmod +666 /tmp/sudoers.bak
sudo echo "$1" >> /tmp/sudoers.bak

# Valida se a alteração está correta
sudo visudo -cf /tmp/sudoers.bak

# Se sim, aplica a alteração no arquivo original
if [ $? -eq 0 ]; then
  sudo cp /tmp/sudoers.bak /etc/sudoers
else
  echo "Não foi possível alterar /etc/sudoers."
fi

# Remove arquivo de backup
sudo rm /tmp/sudoers.bak