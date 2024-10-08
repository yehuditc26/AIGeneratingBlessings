FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
EXPOSE 8080
COPY . .
RUN chown -R node /usr/src/app
USER node
CMD ["node", "app.js"]
