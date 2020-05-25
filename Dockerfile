# Stage 1 - build project
FROM node:13.14 as build

WORKDIR /app

COPY helloworld-app/. .

RUN npm install

RUN npm run build

# Stage 2 - the production environment
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
