
FROM node:12.16.2-buster-slim
RUN mkdir /home/node/app/ && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node package.json ./
COPY --chown=node:node yarn.lock ./
USER node
RUN yarn

COPY --chown=node:node src ./src/
COPY --chown=node:node .babelrc .
COPY --chown=node:node .env .
COPY --chown=node:node key.json .

RUN yarn build
EXPOSE 8080
CMD ["yarn", "start"]