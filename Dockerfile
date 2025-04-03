FROM openjdk:17-alpine
WORKDIR /app
COPY . /app
RUN ./gradlew build --no-daemon
ENTRYPOINT ["java", "-jar", "build/libs/*.jar"]



