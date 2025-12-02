FROM maven:3.6.3-openjdk-11

WORKDIR /build
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /build
RUN mvn package -DskipTests
RUN mv ./target/hello-1.0.war /usr/local/tomcat/webapps/hello.war