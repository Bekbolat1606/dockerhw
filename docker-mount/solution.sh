#!/bin/bash

# Скачать файлы
curl -o jusan-docker-mount.conf https://example.com/path/to/jusan-docker-mount.conf
curl -o jusan-docker-mount.zip https://example.com/path/to/jusan-docker-mount.zip

# Разархивировать
unzip jusan-docker-mount.zip -d jusan-docker-mount-data

# Запустить контейнер
docker run -d \
  --name jusan-docker-mount \
  -p 9999:80 \
  -v "$(pwd)/jusan-docker-mount.conf:/etc/nginx/conf.d/jusan-docker-mount.conf" \
  -v "$(pwd)/jusan-docker-mount-data:/usr/share/nginx/html/data" \
  nginx:mainline
