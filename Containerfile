FROM node:21-alpine AS build

WORKDIR /app

COPY . /app

RUN npm install --production

FROM docker.io/nginx:1-alpine-slim

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app /app
