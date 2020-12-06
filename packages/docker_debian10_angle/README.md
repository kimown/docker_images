# run
```shell
docker build --build-arg my_http_proxy=$(my_http_proxy) -t docker_debian10_angle:latest . 

docker run --privileged -it docker_debian10_angle /bin/bash
cd /docker_debian10_angle
```