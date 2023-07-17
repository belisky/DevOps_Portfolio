#!/bin/sh
 
java -Ddatasource.dialect="$DB_DIALECT" -Ddatasource.url="$DB_URL" -Ddatasource.username="$DB_USER" -Ddatasource.password="$DB_PASS" \
    -Dspring.profile.active="$DB_SPRING_PROFILE" -jar ./target/lavagna-jetty-console.war

# java -Ddatasource.dialect=HSQLDB -Ddatasource.url=jdbc:hsqldb:mem:lavagna -Ddatasource.username=sa -Ddatasource.password= -Dspring.profiles.active=dev -jar target/dependency/jetty-runner.jar --port 8080 target/*.war
