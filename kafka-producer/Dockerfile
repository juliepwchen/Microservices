FROM node:8-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD kafka_producerStream.js ./
ADD package.json ./
RUN npm install
EXPOSE 5001
CMD ["npm", "start"]
