FROM node:16.20.1

RUN mkdir /front

WORKDIR /front

RUN npm install vite@4.3.9

COPY package.json  package-lock.json ./

RUN npm ci

COPY . .

EXPOSE 3001

CMD ["npm", "run", "dev"]
