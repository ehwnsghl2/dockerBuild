#FROM openjdk:8-jdk-alpine
#ARG JAR_FILE=/build/libs/dockerBuild-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} myboot.jar
#ENTRYPOINT ["java","-jar","/myboot.jar"]


#FROM java:8
#ARG JAR_FILE=build/libs/example-api-0.0.1-SNAPSHOT.jar
#ADD ${JAR_FILE} sample.jar
#ENTRYPOINT ["java","-Xms1024m","-Xmx1024m","-jar","/sample.jar"]

FROM adoptopenjdk/openjdk11
CMD ["./gradlew", "clean", "package"]
ARG JAR_FILE_PATH=build/libs/*.jar
COPY ${JAR_FILE_PATH} app.jar


# 언어 설정
#RUN locale-gen ko_KR.UTF-8
#ENV LANG ko_KR.UTF-8
#ENV LANGUAGE ko_KR.UTF-8
#ENV LC_ALL ko_KR.UTF-8

# TimeZone 설정
#ENV TZ Asia/Seoul
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENTRYPOINT ["java", "-Xms1024m","-Xmx1024m", "-Dspring.profiles.active=${USE_PROFILE}", "-jar", "app.jar"]

# docker build -t docker-example:0.0.1 .
# docker images #images 명령어로 docker이미지가 제대로 만들어 졌는지 확인한다.
# docker run -p 8080:8080 -e USE_PROFILE=dev docker-example:0.0.1

# 환경설정 한국시간 설정