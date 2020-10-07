FROM centos


MAINTAINER vinod9589@gmail.com

RUN mkdir /opt/tomcat/
RUN yum -y install wget
RUN yum -y install unzip

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57-windows-x64.zip
RUN unzip apache-tomcat-8.5.57-windows-x64.zip
RUN mv apache-tomcat-8.5.57/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war

EXPOSE 8080

RUN chmod +x /opt/tomcat/bin/catalina.sh
ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
