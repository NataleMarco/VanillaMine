#!/usr/bin/env bash
set -e

# Iniciar ZeroTier en modo demonio
zerotier-one -d

# Esperar unos segundos para que init initialize
sleep 5

# Unir la red especificada
zerotier-cli join d3ecf5726d55a665

echo "Esperando configuración de ZeroTier..."
# Espera a que ZeroTier reciba IP
while ! zerotier-cli listnetworks | grep -q OK; do
  sleep 1
done

echo "ZeroTier conectado. Redes:"
zerotier-cli listnetworks

# Aceptar EULA y lanzar Minecraft
echo "eula=true" > eula.txt
exec java -Xmx8G -Xms8G -jar server.jar nogui
