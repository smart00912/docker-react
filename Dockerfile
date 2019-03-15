FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install -g n
RUN sudo n 11.10.1
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

