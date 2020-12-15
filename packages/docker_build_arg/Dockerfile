FROM debian:10

COPY . /docker_debian10_angle
RUN echo "start"
RUN env
RUN echo "end"
ARG MY_HTTP_PROXY
RUN echo $MY_HTTP_PROXY
RUN /bin/bash /docker_debian10_angle/build.sh


