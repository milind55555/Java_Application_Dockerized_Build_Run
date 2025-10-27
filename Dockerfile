FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY . /app
RUN javac app.java
CMD ["java", "app"]
