# Stage 1: Build the application
FROM gradle:7-jdk-alpine AS builder
WORKDIR /app
COPY . /app
RUN gradle clean build --no-daemon

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
VOLUME /app/data
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

## Stage 1: Build the application
#FROM gradle:8-jdk17-alpine AS builder
#WORKDIR /app
#
## Copy only the build configuration files first
#COPY build.gradle settings.gradle ./
#COPY gradle ./gradle
## Copy the gradle wrapper
#COPY gradlew ./
#
## Download dependencies first (this layer will be cached)
#RUN ./gradlew dependencies --no-daemon
#
## Now copy the source code
#COPY src ./src
#
## Build the application
#RUN ./gradlew clean build --no-daemon
#
## Stage 2: Create the runtime image
#FROM openjdk:17-alpine
#
## Add a non-root user
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
#
#WORKDIR /app
#
## Copy the jar from builder stage
#COPY --from=builder /app/build/libs/*.jar app.jar
#
## Create data directory with proper permissions
#RUN mkdir -p /app/data && \
#    chown -R appuser:appgroup /app
#
## Set the non-root user
#USER appuser
#
## Configure JVM options
#ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"
#
#VOLUME /app/data
#
#EXPOSE 8080
#
## Add healthcheck
#HEALTHCHECK --interval=30s --timeout=3s \
#  CMD wget -q --spider http://localhost:8080/actuator/health || exit 1
#
#ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]

