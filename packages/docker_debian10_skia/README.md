# run
```shell
docker build --network=host -t docker_debian10_skia:latest . 

docker run --privileged -it docker_debian10_skia /bin/bash
cd /docker_debian10_skia
```