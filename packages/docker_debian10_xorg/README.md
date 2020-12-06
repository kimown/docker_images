# run
```shell
docker build -t docker_debian10_xorg:latest .
docker run --privileged -it docker_debian10_xorg /bin/bash


ttyDevices=" "
lsTTy=`ls /dev/tty*`
for deviceName in lsTTy
do
       ttyDevices="${ttyDevices} --device ${deviceName}"
done
echo "${ttyDevices}"
docker run --gpus all  --cap-add SYS_RAWIO $ttyDevices docker_debian10_xorg /bin/bash
```