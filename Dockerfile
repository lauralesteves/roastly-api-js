FROM node:18-alpine

RUN npm install -g serverless

WORKDIR /app/

COPY ./package.json /app/package.json

RUN npm install

COPY . /app/

EXPOSE 3000

CMD ["npm", "run", "dev"]