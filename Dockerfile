FROM node:14

WORKDIR /var/expressCart

# Instala paquetes adicionales
RUN apt-get update ; apt-get install -y make gcc g++ python bash

COPY lib/ /var/expressCart/lib/
COPY bin/ /var/expressCart/bin/
COPY config/ /var/expressCart/config/
COPY public/ /var/expressCart/public/
COPY routes/ /var/expressCart/routes/
COPY views/ /var/expressCart/views/

COPY app.js /var/expressCart/
COPY package.json /var/expressCart/
COPY deploy.js /var/expressCart/

RUN npm install

VOLUME /var/expressCart/data

EXPOSE 1111
ENTRYPOINT ["npm", "start"]
