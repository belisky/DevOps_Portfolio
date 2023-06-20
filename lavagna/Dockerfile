FROM maven:3.3-jdk-8 AS builder
RUN mkdir -p /lavagna
WORKDIR /lavagna
COPY pom.xml . 
COPY /src .  
RUN mvn verify
COPY . .

FROM openjdk:11
ENV DB_DIALECT MYSQL
ENV DB_URL jbdc:mysql://db:3306/lavagna?verifyServerCertificate=false&useSSL=false&autoReconnect=true
ENV DB_SPRING_PROFILE dev
ENV DB_PASS lavagna1
ENV DB_USER lavagna
RUN mkdir -p /target 
WORKDIR /target 
COPY --from=builder /lavagna/target /target
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh
ENTRYPOINT "./entrypoint.sh"

 
