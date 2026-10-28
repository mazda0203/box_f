# --- build ---
FROM ubuntu:20.04
RUN apt update
RUN apt install maven -y
RUN apt install git -y
WORKDIR /hello
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /hello
RUN mvn package
VOLUME /home/user1/box_f:/hello
RUN cp /hello/target/hello-1.0.war /hello
