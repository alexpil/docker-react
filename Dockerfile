FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# all the filed that we need are in /app/build folder

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /user/share/nginx/html
