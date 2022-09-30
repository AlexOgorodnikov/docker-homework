FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install tomcat9 -y
EXPOSE 8080
RUN mkdir /home/app
RUN git clone https://github.com/daticahealth/java-tomcat-maven-example.git /home/app
RUN cd /home/app; mvn package
RUN find /home/app/target -name "*.war" -exec cp -t /var/lib/tomcat9/webapps {} +
CMD ["catalina.sh", "run"]