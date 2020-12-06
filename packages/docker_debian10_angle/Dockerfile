FROM docker_debian10_xorg:latest

COPY . /docker_debian10_angle
ENV my_http_proxy ${my_http_proxy}


RUN /bin/bash /docker_debian10_angle/build.sh


