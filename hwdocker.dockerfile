FROM ubuntu:22.04
RUN apt-get update
RUN apt-get istall git
RUN apt-get install default-jdk
RUN apt-get istall maven
RUN apt-get istall tomcat9
EXPOSE 8080
RUN mkdir /home/app
RUN git clone https://github.com/daticahealth/java-tomcat-maven-example.git /home/app
RUN cd /home/app; mvn package
RUN find /home/app/target -name *.war | cp /var/lib/tomcat9/webapps
CMD ["catalina.sh", "run"]