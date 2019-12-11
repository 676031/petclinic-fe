FROM nginx:latest

COPY /conf.d/nginx.conf /etc/nginx/conf.d/default.conf

FROM node:latest

# Создать директорию app
WORKDIR /app
# ENV PATH /app/node_modules/.bin:$PATH
#COPY /conf.d/nginx.conf /etc/nginx/conf.d/default.conf

# Установить зависимости приложения
# Используется символ подстановки для копирования как package.json, так и package-lock.json,
# работает с npm@5+
COPY package*.json /app/

RUN npm install
# Используется при сборке кода в продакшене
# RUN npm install --only=production

# Скопировать исходники приложения
COPY ./ /app/

EXPOSE 3000
CMD [ "node", "server.js" ]
#RUN npm run build

#FROM nginx:1.15

#COPY /conf.d/nginx.conf /etc/nginx/conf.d/default.conf