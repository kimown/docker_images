FROM docker_debian10_xorg:latest
ARG MY_HTTP_PROXY
ENV MY_HTTP_PROXY=$MY_HTTP_PROXY

COPY . /docker_debian10_angle

RUN /bin/bash /docker_debian10_angle/build.sh


