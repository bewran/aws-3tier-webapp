FROM node:22-alpine

ENV NODE_ENV=production
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --omit=dev --no-audit --no-fund && npm cache clean --force

COPY --chown=node:node app.js ./
USER node
EXPOSE 3000
CMD ["node", "app.js"]
