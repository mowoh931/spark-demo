# Stage 1: Build
FROM gradle:8.9.0-jdk17-alpine AS builder
WORKDIR /app
COPY . /app
RUN gradle build --no-daemon

# Stage 2: Run
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]