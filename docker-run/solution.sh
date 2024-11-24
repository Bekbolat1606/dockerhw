#!/bin/bash
# Запуск контейнера
docker run -d --name jsn-dkr-run -p 8888:80 nginx:mainline

# Список активных контейнеров
docker ps

# Остановка контейнера
docker stop jsn-dkr-run

# Список активных контейнеров
docker ps

# Список всех контейнеров
docker ps -a
