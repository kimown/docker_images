```shell
export MY_HTTP_PROXY=http://10.20.30.2:1234

docker build -t docker_build_arg:latest --build-arg MY_HTTP_PROXY .

#https://docs.docker.com/engine/reference/commandline/build/
```