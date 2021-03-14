FROM tomcat:8

COPY ./ /usr/local/tomcat/webapps 

EXPOSE 8080

CMD ["catalina.sh","run"]