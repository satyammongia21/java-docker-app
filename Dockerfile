FROM openjdk:17 AS build
WORKDIR /app
COPY . .
RUN javac HelloWorld.java
RUN jar cfe HelloWorld.jar HelloWorld HelloWorld.class
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/HelloWorld.jar .
ENTRYPOINT ["java", "-jar", "HelloWorld.jar"]
