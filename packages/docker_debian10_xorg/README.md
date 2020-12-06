# run
```shell
docker build -t docker_debian10_xorg:latest .

docker run --privileged -it docker_debian10_xorg /bin/bash
cd /docker_debian10_xorg
pm2 start build.js && cat /root/.pm2/logs/build-out.log

#验证tty写权限
echo '11' >/dev/tty0

# start DISPLAY
glxgears
export DISPLAY=:0
glxgears



ttyDevices=" "
lsTTy=`ls /dev/tty*`
for deviceName in $lsTTy
do
       ttyDevices="${ttyDevices} --device ${deviceName}"
done
echo "${ttyDevices}"
docker run --gpus all  --cap-add SYS_RAWIO ${ttyDevices} -it docker_debian10_xorg /bin/bash
```