FROM tomcat:9.0.67-jdk11-temurin-jammy
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN mkdir /home/app
RUN git clone https://github.com/daticahealth/java-tomcat-maven-example.git /home/app
RUN cd /home/app; mvn package
RUN find /home/app/target -name "*.war" -exec cp -t /usr/local/tomcat/webapps {} +
CMD ["catalina.sh", "run"]
#test 10