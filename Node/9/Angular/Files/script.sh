#!/usr/bin/env bash

#Instalação dos pacotes npm
cd $VOLUME

#Efetua o processo de build da proposta
npm run-script start -- -H 0.0.0.0 --port 80 --disable-host-check

#Retorna um terminal
/bin/bash


