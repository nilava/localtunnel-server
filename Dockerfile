FROM node:lts-alpine3.12

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV production

EXPOSE 80

ENTRYPOINT ["node", "-r", "esm", "./bin/server"]
