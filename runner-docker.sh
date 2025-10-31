#!/bin/bash

#Тут еще можно было бы сделать запрос на получение ввода, установлен ли Docker, затаем куча других запросом)
#В дааной ситуации будем считать, что runner будет запущен только в контейнере, если пользователь этого не желает то просто выход.
# Дальше решает самостоятельно как его устанавливать.
# Но в реальной работе я бы сделал все проверки в скрипте.

while true; do 
  read -r -n 1 -p $'\n'"Gitlab runner will be run in Docker. Do you agree? (y/n):" yn
  case $yn in
  [Yy]*)
    Docker run -d --name gitlab-runner --restart always \
    -v /srv/gitlab-runner/config:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:latest 
  
    docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register
    echo -e "\n"
    break
    ;;
  [Nn]*)
    echo -e "\n"
    break
    ;;
  [*])
    echo -e "\nPlease answer Y or N!\n" ;;
  esac
done