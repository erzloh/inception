include ./srcs/.env
COMPOSE_FILE_PATH = ./srcs/docker-compose.yml
PROJECT_NAME = inception

all: create_volume_folders up

up:
	@docker compose -f ${COMPOSE_FILE_PATH} -p ${PROJECT_NAME} up -d --build

down:
	@docker compose -f ${COMPOSE_FILE_PATH} -p ${PROJECT_NAME} down --remove-orphans

create_volume_folders:
	mkdir -p ${VOLUME_PATH}/wordpress
	mkdir -p ${VOLUME_PATH}/mariadb

delete_volume_folders:
	rm -rf ${VOLUMES_PATH}

clean: down delete_volume_folders
	docker network prune -f
	docker system prune -f -a
	docker volume prune -f

re: clean all

nginx:
	docker exec -it nginx bash

wordpress:
	docker exec -it wordpress bash

mariadb:
	docker exec -it mariadb bash


.PHONY: all up down create_volume_folders clean re nginx wordpress mariadb
