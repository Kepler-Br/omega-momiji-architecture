FROM openjdk:17-alpine AS builder

RUN apk add git

RUN git clone https://github.com/Kepler-Br/omega-momiji-robot.git ro-bot && \
    git clone https://github.com/Kepler-Br/omega-momiji-api.git api

WORKDIR /api

RUN ./gradlew build publishToMavenLocal

WORKDIR /ro-bot

RUN ./gradlew build bootJar


FROM openjdk:17-alpine

WORKDIR /content

COPY --from=builder /ro-bot/server/build/libs/server-0.0.1.jar ./app.jar
