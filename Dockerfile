# --- build ---
FROM maven:3.10.0-eclipse-temurin-17
RUN apt update
RUN apt install git -y
VOLUME /home/user1/box_f:/target
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cp -a /boxfuse-sample-java-war-hello/. /
RUN mvn package
