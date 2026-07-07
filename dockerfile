#choosing the base image as the build stage:
FROM node:16-alpine as build
WORKDIR /app
COPY package.json .
RUN npm install -r package.json
COPY . . 
RUN npm run build

FROM nginx:alpine 
WORKDIR /usr/share/nginx/html/
COPY --from=build /app/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
