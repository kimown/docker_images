FROM debian:10

COPY . /docker_debian10_angle
RUN env
ARG MY_HTTP_PROXY
ENV MY_HTTP_PROXY=$MY_HTTP_PROXY
RUN env
RUN /bin/bash /docker_debian10_angle/build.sh


