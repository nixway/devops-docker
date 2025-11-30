FROM ubuntu:20.04

ENV TZ=Asia/Amaty
WORKDIR /boxfuse

RUN apt update
RUN apt install tzdata -y
RUN apt install default-jdk maven git tomcat9 -y

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /boxfuse

RUN mvn package -DskipTests
RUN mv ./target/hello-1.0.war /var/lib/tomcat9/webapps/hello.war

ENV PATH="$PATH:/usr/share/tomcat9/bin"
ENV CATALINA_HOME=/usr/share/tomcat9
ENV CATALINA_BASE=/var/lib/tomcat9
ENV CATALINA_TMPDIR=/tmp
ENV JAVA_OPTS=-Djava.awt.headless=true

EXPOSE 8080

WORKDIR /var/lib/tomcat9/webapps

RUN rm -rf /boxfuse
RUN apt purge git maven -yc

CMD ["catalina.sh", "run"]
