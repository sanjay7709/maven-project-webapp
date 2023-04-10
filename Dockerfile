FROM maven as build 
WORKDIR /usr
COPY . .
RUN mvn clean package

FROM tomcat
COPY --from=build /target/webapp*.war /usr/local/tomcat/webapp
EXPOSE 9090
RUN echo "completing setup"

# FROM openjdk:11.0
# WORKDIR /app
# COPY --from=build /app/target/*.war /app
# EXPOSE 9090
# CMD ["java","jar","*.war"]
