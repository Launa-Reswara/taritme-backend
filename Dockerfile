FROM node:alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install
COPY . ./

EXPOSE 5000

# run dev
CMD ["npm", "run", "dev"]
