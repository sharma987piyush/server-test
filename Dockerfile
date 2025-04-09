FROM node:alpine

WORKDIR /app

RUN npx create-react-app test-app

WORKDIR /app/test-app

EXPOSE 3000

CMD ["npm", "start"]
