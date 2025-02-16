# "Standard" JVM build using Temurin, local
#FROM eclipse-temurin:latest
#COPY target/*.jar /app.jar
#EXPOSE 8080
#CMD ["java", "-jar", "/app.jar"]

## "Standard" JVM build using Temurin, local, extracted jar
#FROM eclipse-temurin:latest
#WORKDIR /app
#COPY target/*.jar ./myapp.jar
#RUN jar -xvf myapp.jar
#EXPOSE 8080
#CMD ["java", "org.springframework.boot.loader.launch.JarLauncher"]

# Distroless, local
#FROM mcr.microsoft.com/openjdk/jdk:21-distroless
#COPY target/*.jar /app.jar
#EXPOSE 8080
#CMD ["-Xmx256m", "-jar", "/app.jar"]

# Native image, local
#FROM alpine:latest
#WORKDIR /app
#COPY target/catwd-demo /app/
#EXPOSE 8080
#CMD ["/app/catwd-demo"]

# Irrelevant if we're doing the native image build using the NIK
## Stage 1: Build the application
#FROM maven:3.9.9-eclipse-temurin-21 AS build
#WORKDIR /app
#COPY pom.xml .
#COPY src ./src
#RUN mvn clean package -DskipTests
#
## Stage 2: Package the application
##FROM openjdk:21-jdk-slim
#FROM eclipse-temurin:21-alpine
#WORKDIR /app
#COPY --from=build /app/target/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]
