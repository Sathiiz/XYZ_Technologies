# Use Tomcat as the base image
FROM tomcat:9-jdk11-temurin-focal

# Expose port 8080
EXPOSE 8080

# Copy the WAR file to the Tomcat webapps directory
COPY ./target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
