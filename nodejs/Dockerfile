FROM node:19.9.0-alpine3.17

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

EXPOSE 8080

ENTRYPOINT [ "npm", "start" ]