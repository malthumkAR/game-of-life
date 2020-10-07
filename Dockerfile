FROM centos


MAINTAINER vinod9589@gmail.com

RUN mkdir /opt/tomcat/
RUN yum -y install wget
RUN yum -y install unzip

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38.zip
RUN unzip apache-tomcat-9.0.38.zip
RUN mv apache-tomcat-9.0.38/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN wget https://tomcat.apache.org/tomcat-9.0-doc/appdev/sample/sample.war

EXPOSE 8080

RUN chmod +x /opt/tomcat/bin/catalina.sh
ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
