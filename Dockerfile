FROM node AS builder

RUN mkdir /app
WORKDIR /app

ADD package.json /app/
ADD package-lock.json /app/

COPY . /app/

RUN npm install
