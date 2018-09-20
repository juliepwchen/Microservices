FROM node:8-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD kafka-consumer-websocket.js ./
ADD package.json ./
RUN npm install
EXPOSE 5003
CMD ["npm", "start"]
