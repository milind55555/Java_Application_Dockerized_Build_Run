FROM openjdk:8-jdk-alpine
COPY app.class /app.class
CMD ["java", "app"]
