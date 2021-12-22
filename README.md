# snell-server-docker

[![Docker Stars](https://img.shields.io/docker/stars/geekdada/snell-server.svg?style=flat-square)](https://hub.docker.com/r/geekdada/snell-server/)
[![Docker Pulls](https://img.shields.io/docker/pulls/geekdada/snell-server.svg?style=flat-square)](https://hub.docker.com/r/geekdada/snell-server/)

Docker image for [snell-server](https://github.com/surge-networks/snell)

```bash
docker run -e PSK=<your_psk_here> -p <your_host_port_here>:9102 --restart unless-stopped -d geekdada/snell-server:latest
```

The default `OBFS` setting is `tls`, you can switch it to `http` by adding `-e OBFS=http` to the docker run args.