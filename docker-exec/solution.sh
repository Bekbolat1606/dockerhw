#!/bin/bash

# Шаг 1: Запуск контейнера с параметрами
sudo docker run -d \
  --name jusan-docker-exec \
  -p 8181:80 \
  nginx:mainline

# Шаг 2: Заходим в терминал контейнера
sudo docker exec -it jusan-docker-exec bash

# Шаг 3: Создаем новый конфигурационный файл для nginx
cat << EOF > /etc/nginx/conf.d/jusan-docker-exec.conf
server {
    listen 80;
    server_name jusan.singularity;

    location / {return 200 'Hello, from jusan-docker-exec';}
    location /home {return 201 'This is my home!';}
    location /about {return 202 'I am just an exercise!';}
}
EOF

# Шаг 4: Перезагружаем nginx внутри контейнера
nginx -s reload

# Шаг 5: Выход из терминала контейнера
exit

# Шаг 6: Проверка запросов с помощью curl
curl http://localhost:8181
curl http://localhost:8181/home
curl http://localhost:8181/about

# Шаг 7: Просмотр логов nginx
docker logs jusan-docker-exec
