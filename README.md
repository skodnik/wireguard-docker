# WireGuard in docker

[WireGuard®](https://www.wireguard.com/) is an extremely simple yet fast and modern VPN that utilizes state-of-the-art
cryptography. It aims to be faster, simpler, leaner, and more useful than IPsec, while avoiding the massive headache. It
intends to be considerably more performant than OpenVPN.

Image source: [linuxserver/wireguard](https://hub.docker.com/r/linuxserver/wireguard)

## Dependencies

- [make](https://www.gnu.org/software/make/manual/html)
- [docker](https://www.docker.com/get-started)
- [docker-compose](https://docs.docker.com/compose/)
- [git](https://git-scm.com/)
- [qrencode](https://linux.die.net/man/1/qrencode)

## App initialize

```shell
git clone git@github.com:skodnik/wireguard-docker.git
cd wireguard-docker
cp .env.dist .env
```

## Build and run

```shell
make up
```

## Down and remove container

```shell
make down
```

## Start stop

```shell
make start
make stop
```

## Status

```shell
make ps

  Name      Command   State                      Ports
--------------------------------------------------------------------------
wireguard   /init     Up      0.0.0.0:51820->51820/udp,:::51820->51820/udp
```

## Aliases

```shell
alias wg.start="make --directory=\"/home/user/apps/wireguard-docker\" --no-print-directory start"
alias wg.stop="make --directory=\"/home/user/apps/wireguard-docker\" --no-print-directory stop"
alias wg.ps="make --directory=\"/home/user/apps/wireguard-docker\" --no-print-directory ps"
```

## WireGuard client apps

[wireguard.com/install](https://www.wireguard.com/install/)