FROM amd64/openjdk:8-slim
WORKDIR /app
COPY ./target/my-app-1.0-SNAPSHOT.jar ./
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
