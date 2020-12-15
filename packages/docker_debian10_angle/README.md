# run
```shell
docker build --network=host -t docker_debian10_angle:latest --build-arg MY_HTTP_PROXY .

#docker run --network=host --privileged -it docker_debian10_xorg /bin/bash
docker run --network=host --privileged -it docker_debian10_angle /bin/bash
cd /docker_debian10_angle
```










```shell
docker commit d610416404b0 mytest
docker run --privileged -it  mytest bash
```