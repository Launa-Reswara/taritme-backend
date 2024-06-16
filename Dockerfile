FROM node:alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . ./

# run dev
CMD ["npm", "run", "dev"]
