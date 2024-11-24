#!/bin/bash
# Скачиваем nginx.conf
curl -o nginx.conf https://raw.githubusercontent.com/jusan-official/nginx-configs/main/docker-bind/nginx.conf

# Запускаем контейнер с необходимыми параметрами
docker run -d \
  --name jusan-docker-bind \
  -p 7777:80 \
  -v "$(pwd)/nginx.conf:/etc/nginx/nginx.conf" \
  nginx:mainline

# Проверяем список запущенных контейнеров
docker ps

# Просматриваем логи контейнера
docker logs jusan-docker-bind
