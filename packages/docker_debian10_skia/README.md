# run
```shell
docker build --network=host -t docker_debian10_skia:latest . 

docker run --network=host --privileged -it docker_debian10_skia /bin/bash
cd /docker_debian10_skia
```