const childProcess = require('child_process')
const http = require('http');
const fs = require('fs')
const str = childProcess.execSync('ls /proc/driver/nvidia/gpus/').toString()
const idAr = str.split(':')
const hexString = idAr[1]
console.info(hexString)
const readId = parseInt(hexString, 16)

const tmpu_2ead35 = `
Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
    BusID          "PCI:${readId}:0:0"
EndSection


Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    DefaultDepth    24
    Option         "AllowEmptyInitialConfiguration" "True"
    SubSection     "Display"
        Depth       24
        Virtual 1024 768
    EndSubSection
EndSection


Section "ServerLayout"
    Identifier     "Layout0"
    Screen 0 "Screen0" 0 0
EndSection
`
console.info(tmpu_2ead35)
fs.writeFileSync('/tmp/tmpu_2ead35',tmpu_2ead35, 'utf8')


const hostname = '0.0.0.0';
const PORT0 = process.env.PORT0 || 3000
const port = PORT0;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

function run(){
  const args = ["-noreset", "+extension", "GLX", "+extension", "RANDR", "+extension", "RENDER", "-config", "/tmp/tmpu_2ead35", ":0"]

  const ls= childProcess.spawn("Xorg", args);

  ls.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`)
  })

  ls.stderr.on('data', (data) => {
    console.log(`stderr: ${data}`)
  })

  ls.on('close', (code) => {
    console.log(`child process exited with code ${code}`)
  })

  ls.on('error', (err) => {
    console.error('Failed to start subprocess.',err);
  })
}

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
  run()
});