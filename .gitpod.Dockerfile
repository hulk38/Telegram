FROM gitpod/workspace-full

USER gitpod

# Instalar el JDK y las herramientas necesarias
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-11-jdk && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Instalar el SDK de Android
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip -O android-sdk.zip && \
    mkdir -p /home/gitpod/android-sdk/cmdline-tools && \
    unzip -q android-sdk.zip -d /home/gitpod/android-sdk/cmdline-tools && \
    rm android-sdk.zip

# Configurar el SDK de Android
ENV ANDROID_SDK_ROOT=/home/gitpod/android-sdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

# Aceptar las licencias del SDK de Android
RUN yes | sdkmanager --licenses
