FROM maven:3.3-jdk-8 AS builder
#RUN mkdir -p /lavagna
#WORKDIR /lavagna
#COPY . . 
#RUN mvn verify


FROM openjdk:8u111-jre-alpine 
RUN mkdir -p /src 
WORKDIR /src 
#COPY --from=builder /lavagna/target ./target
COPY target ./target
COPY entrypoint.sh .
RUN chmod a+x ./entrypoint.sh
RUN ls -la 

#RUN apt-get update && apt-get install netstat -y
CMD "./entrypoint.sh"


