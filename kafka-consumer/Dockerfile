FROM node:8-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD kafka_consumerStream.js ./
ADD package.json ./
RUN npm install
EXPOSE 5002
CMD ["npm", "start"]
