#!/bin/bash

# Скачиваем конфигурационные файлы
#Skachival i razarhiviroval vruchnuyu

# Собираем образ
docker build -t nginx:jusan-dockerfile .

# Проверяем наличие образа
docker images

# Запускаем контейнер
docker run -d -p 6060:80 --name jusan-dockerfile nginx:jusan-dockerfile
