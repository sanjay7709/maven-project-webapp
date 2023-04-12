FROM maven as build 
WORKDIR /usr
COPY . .
RUN mvn clean package

FROM tomcat
COPY --from=build /usr/target/*.war /usr/local/tomcat/webapps/webmvn.war
EXPOSE 8080
RUN echo "completing setup"

# FROM openjdk:11.0
# WORKDIR /app
# COPY --from=build /app/target/*.war /app
# EXPOSE 9090
# CMD ["java","jar","*.war"]
