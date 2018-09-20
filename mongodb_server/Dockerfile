FROM node:8-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD index.js ./
ADD package.json ./
ADD models /usr/src/app/models
ADD config /usr/src/app/config
RUN npm install
EXPOSE 5000
CMD ["npm", "start"]
