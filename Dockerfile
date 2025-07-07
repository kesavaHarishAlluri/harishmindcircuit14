FROM maven AS buildstage
RUN mkdir /opt/harishmindcircuit14
WORKDIR /opt/harishmindcircuit14
COPY . .
RUN mvn clean install    ## artifact -- .war 

## tomcat deploy stage 
FROM tomcat 
WORKDIR webapps 
COPY --from=buildstage /opt/harishmindcircuit14/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
