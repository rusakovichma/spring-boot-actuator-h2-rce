FROM openjdk:8-jdk-alpine
RUN apk add --no-cache curl
ARG JAR_FILE=target/*.jar
ARG PROPERTIES_FILE=application.properties
COPY ${JAR_FILE} app.jar
COPY ${PROPERTIES_FILE} application.properties
ENTRYPOINT ["java","-javaagent:'/rasp/rasp.jar'","-jar","/app.jar"]
