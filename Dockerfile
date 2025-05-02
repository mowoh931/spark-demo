# Stage 1: Build
FROM gradle:8.9.0-jdk17-alpine AS builder
WORKDIR /app
COPY build.gradle settings.gradle /app/
COPY src /app/src
RUN gradle build --no-daemon

# Stage 2: Run
FROM openjdk:17-alpine

# Create a non-root user with a numeric UID
RUN addgroup -S appgroup && adduser -S appuser -G appgroup -u 1000

WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
#gradle build -x test