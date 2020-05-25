# Stage 1 - build project
FROM node:10 as build

RUN cd /app

COPY helloworld/. .

RUN npm install

RUN npm run build

# Stage 2 - the production environment
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
