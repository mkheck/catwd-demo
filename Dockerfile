# "Standard" JVM build using Temurin, local
#FROM eclipse-temurin:latest
#COPY target/*.jar /app.jar
#EXPOSE 8080
#CMD ["java", "-jar", "/app.jar"]

# "Standard" JVM build using Temurin, local, extracted jar
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
##CMD ["-XX:MaxRAMPercentage=25.0", "-jar", "/app.jar"]

# "Standard" JVM build using Temurin, local, fully executable jar
# No real benefit to doing this, and it doesn't properly process SIGTERM.
# For instructional purposes only. ;)
#FROM eclipse-temurin:latest
#RUN groupadd --system appgroup && \
#    useradd --system --gid appgroup --create-home appuser
#WORKDIR /app
#RUN chown -R appuser:appgroup /app
#COPY target/*.jar /app.jar
#RUN chmod +x /app.jar
#USER appuser
#CMD ["/app.jar"]

# Native image, local - can anyone ID the flaw here?
# (App is built on MacOS, container image is built around Alpine Linux)
#FROM alpine:latest
#WORKDIR /app
#COPY target/catwd-demo /app/
#EXPOSE 8080
#CMD ["/app/catwd-demo"]

# CNBs have entered the chat

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
