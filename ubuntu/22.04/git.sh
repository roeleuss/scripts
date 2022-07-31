#!/bin/bash

####################################################
# Configura git com nome e email informados
####################################################

## Configura usuário
git config --global user.name "$1"
git config --global user.email "$2"

## Ativa recurso para salvar credential
git config --global credential.helper store