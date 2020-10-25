FROM node:12

WORKDIR /usr/src/app

COPY . .

RUN npm install \
 && npm run build

EXPOSE 8080

CMD npm start