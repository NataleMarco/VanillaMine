FROM openjdk:21-jdk-slim

# Instalación de curl y unzip (si necesitas descomprimir algo) y ZeroTier
RUN apt-get update && apt-get install -y curl \
  && curl -s https://install.zerotier.com/ | bash \
  && rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /opt/minecraft

COPY data/server.jar server.jar

# Puerto expuesto de Minecraft
EXPOSE 25565

# Script de arranque
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
