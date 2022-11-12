#!/usr/bin/make

# Makefile readme (ru): http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html
# Makefile readme (en): https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents

# @see https://hub.docker.com/r/linuxserver/wireguard

.PHONY: help up start stop restart down read.config read.user.config qr.user.config ps docker.info docker.ps docker.disk.usage docker.images.list docker.containers.list docker.volumes.list docker.volumes.list.dangling docker.system.prune docker.volumes.prune
.DEFAULT_GOAL: help

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[.a-zA-Z0-9_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

### Base commands
up: ## Create and start containers
	@docker-compose up --build --detach

start: ## Start containers
	@docker-compose start

stop: ## Stop containers
	@docker-compose stop

restart: stop start ## Restart containers

down: ## Down and remove containers
	@docker-compose down --volumes --remove-orphans

### Wireguard
read.config: ## Read config
	@cat /usr/share/appdata/wireguard/config/wg0.conf

read.user.config: ## Read first user config
	@cat /usr/share/appdata/wireguard/config/peer1/peer1.conf

qr.user.config: ## Show user config QR
	qrencode -t ANSI -8 -o - -r /usr/share/appdata/wireguard/config/peer1/peer1.conf

### Docker compose commands
ps: ## List project containers
	@docker-compose ps

### Docker monitoring useful commands
# https://blog.softwaremill.com/how-to-keep-your-docker-installation-clean-98a74eb7e7b3
docker.info: ## Docker info
	docker info

docker.ps: ## Docker info
	docker ps

docker.disk.usage: ## Show docker disk usage
	docker system df --verbose

docker.images.list: ## Docker list images with size
	docker image ls --all

docker.containers.list: ## Docker list containers with size
	docker container ls --size --all

docker.volumes.list: ## Docker list volumes
	docker volume ls

docker.volumes.list.dangling: ## Docker list dangling volumes
	docker volume ls --filter dangling=true

docker.system.prune: ## Remove all unused images not just dangling ones
	docker system prune

docker.volumes.prune: ## Remove all unused volumes
	docker volume prune