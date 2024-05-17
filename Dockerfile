FROM node:alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# run dev
CMD ["npm", "run", "dev"]
