FROM maven:3.3-jdk-8 AS builder
RUN mkdir -p /docs
WORKDIR /docs
COPY /src /src 
COPY pom.xml .  
VOLUME /docs
CMD "mvn stampo:serve"

#FROM nginx:stable-alpine
#COPY --from=builder /docs/target/generated-docs /usr/share/nginx/lavagna-docs
#COPY ./nginx.conf /etc/nginx/nginx.conf
 
