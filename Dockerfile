# TODO: Move download links to environment variables
# TODO: Multi-stage

FROM openjdk:8

WORKDIR /minecraft

# Download and install Minecraft Forge server
RUN wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.5/forge-1.15.2-31.2.5-installer.jar && \
    java -jar forge-1.15.2-31.2.5-installer.jar --installServer && \
    rm forge-1.15.2-31.2.5-installer.jar

# Agree with EULA
RUN bash -c "echo eula=true > eula.txt"

# Copy server configuration
COPY server.properties .
COPY ops.txt .
COPY mods .

EXPOSE 25565

CMD ["java", "-jar", "forge-1.15.2-31.2.5.jar"]