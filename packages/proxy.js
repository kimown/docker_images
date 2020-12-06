const net = require('net')

const my_http_proxy = process.env.my_http_proxy

if (my_http_proxy) {
  console.info('my_http_proxy',my_http_proxy)
}else {
  throw Error(`my_http_proxy not exist`)
}

net.createServer(function (from) {
  const to = net.createConnection({
    host:my_http_proxy.split(':')[0],
    port:my_http_proxy.split(':')[1]
  })
  from.pipe(to)
  to.pipe(from)
}).listen(8888, '0.0.0.0')

// pm2 start proxy.js
// curl -x 0.0.0.0:8888 ip.me