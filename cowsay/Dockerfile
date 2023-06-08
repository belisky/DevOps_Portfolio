FROM node:16
# FROM Node:16-alpine

#apk add --update npm

WORKDIR /usr/src/app


COPY package*.json ./

RUN npm install

COPY . .

RUN chmod +x entrypoint.sh

EXPOSE 8080 

ENTRYPOINT ./entrypoint.sh