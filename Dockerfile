FROM node:lts-alpine
# vue-cli reqires 8.10.0+ 

# RUN apt-get -y update \
#   && apt-get install -y git

RUN npm install -g @vue/cli
RUN npm install -g node-gyp

# RUN rm -rf /usr/local/bin/yarn
# RUN rm -rf /usr/local/bin/yarnpkg
# RUN npm install -g yarn

WORKDIR /app

COPY package.json ./package.json
RUN yarn cache clean
RUN yarn install

USER node