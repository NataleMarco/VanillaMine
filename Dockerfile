FROM openjdk:21-jdk-slim

# Instalación de curl y unzip (si necesitas descomprimir algo) y ZeroTier
RUN apt-get update && apt-get install -y curl \
  && curl -s https://install.zerotier.com/ | bash \
  && rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /opt/minecraft

# Descarga del server.jar de Minecraft 1.27.7
ADD https://piston-data.mojang.com/v1/objects/05e4b48fbc01f0385adb74bcff9751d34552486c/server.jar server.jar

# Puerto expuesto de Minecraft
EXPOSE 25565

# Script de arranque
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
