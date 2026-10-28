# --- build ---
FROM ubuntu:20.04 AS build
RUN apt update
RUN apt install maven -y
RUN apt install git -y
WORKDIR /hello
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /hello
RUN mvn package
#--- app ---
FROM tomcat:9.0
COPY --from=build /hello/target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
