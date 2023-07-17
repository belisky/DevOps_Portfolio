FROM maven:3.3-jdk-8 AS builder
RUN mkdir -p /docs
WORKDIR /docs
COPY . .
RUN mvn stampo:build
RUN chmod -R 755 target

FROM nginx:stable-alpine
COPY --from=builder /docs/target/lavagna/help /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
 
