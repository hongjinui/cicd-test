FROM openjdk:8-jdk-alpine
ARG JAR_FILE=build/libs/cicd-test-1.0.0.war
COPY ${JAR_FILE} cicd.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","/cicd.war"]
VOLUME /tmp