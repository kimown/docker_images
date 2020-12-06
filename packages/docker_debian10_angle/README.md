# run
```shell
docker build --network=host -t docker_debian10_angle:latest . 

#docker run --network=host --privileged -it docker_debian10_xorg /bin/bash
docker run --network=host --privileged -it docker_debian10_angle /bin/bash
cd /docker_debian10_angle
```