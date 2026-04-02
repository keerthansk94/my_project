FROM maven as buildstage
WORKDIR /app
COPY pom.xml ./
COPY ./src /app/src
RUN mvn package

FROM tomcat
COPY --from=buildstage /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]