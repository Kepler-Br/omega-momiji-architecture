FROM openjdk:17

RUN apt update && apt install git

RUN git clone https://github.com/Kepler-Br/omega-momiji-messenger-gateway.git gateway && \
    git clone https://github.com/Kepler-Br/omega-momiji-api.git api

WORKDIR /api

RUN ./gradlew build publishToMavenLocal

WORKDIR /gateway

RUN ./gradlew build bootJar
