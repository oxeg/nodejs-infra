FROM node:19.9.0-bullseye

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

EXPOSE 8080

ENTRYPOINT [ "npm", "start" ]