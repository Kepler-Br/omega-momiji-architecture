FROM openjdk:17-alpine AS builder

RUN apk add git

RUN git clone https://github.com/Kepler-Br/omega-momiji-messenger-gateway.git /gateway && \
    git clone https://github.com/Kepler-Br/omega-momiji-api.git /api && \
    cd /api && git checkout

WORKDIR /api

RUN ./gradlew build publishToMavenLocal

WORKDIR /gateway

RUN ./gradlew build bootJar


FROM openjdk:17-alpine

WORKDIR /content

COPY --from=builder /gateway/server/build/libs/server-0.0.1.jar ./app.jar
