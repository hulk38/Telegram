FROM gitpod/workspace-full

USER gitpod

# Instalar el SDK de Android y las herramientas de línea de comandos
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-11-jdk android-sdk && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
