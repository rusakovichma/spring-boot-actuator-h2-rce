FROM openjdk:8-jdk-alpine
RUN apk add --no-cache curl
ARG JAR_FILE=target/*.jar
ARG PROPERTIES_FILE=application.properties
ARG RASP=rasp/
ARG RASP_INSTALL=RaspInstall.jar
COPY ${JAR_FILE} app.jar
COPY ${PROPERTIES_FILE} application.properties
COPY ${RASP} /rasp/
COPY ${RASP_INSTALL} RaspInstall.jar
ENTRYPOINT ["java","-javaagent:rasp/rasp.jar","-jar","/app.jar"]
