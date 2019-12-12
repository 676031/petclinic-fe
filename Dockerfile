FROM node:latest
# Создать директорию app
WORKDIR /app
# Установить зависимости приложения
# Используется символ подстановки для копирования как package.json, так и package-lock.json,
# работает с npm@5+
COPY package*.json /app/
RUN npm install
# Скопировать исходники приложения
COPY ./ /app/
EXPOSE 8080
# Используется при сборке кода в продакшене
RUN npm run build:clean
#CMD [ "node", "server.js" ]

FROM nginx:latest
COPY --from=0 /app/build/ /opt/app-root/src/html
COPY --from=0 /app/conf.d/nginx.conf /etc/nginx/conf.d/default.conf