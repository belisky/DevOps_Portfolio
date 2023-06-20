#!/bin/bash
java -Ddatasource.dialect="$DB_DIALECT" -Ddatasource.url="$DB_URL" -Ddatasource.username="$DB_USER" -Ddatasource.password="$DB_PASS" \
	-Dspring.profile.active="$DB_SPRING_PROFILE" -jar /target/lavagna-jetty-console.war 

