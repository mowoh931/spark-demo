# Stage 1: Build
FROM gradle:8.9.0-jdk17-alpine AS build
WORKDIR /app
COPY . /app
RUN gradle build --no-daemon

# Stage 2: Run
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar /app/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/*.jar"]