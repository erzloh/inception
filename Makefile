COMPOSE_FILE_PATH = ./srcs/docker-compose.yml
PROJECT_NAME = inception
VOLUME_PATH = /Users/eric/data
# Make the volume path available to the docker-compose file as an environment variable
export VOLUME_PATH

# Create volume folders, build the images and start the containers
all: create_volume_folders up

up:
	@docker compose -f ${COMPOSE_FILE_PATH} -p ${PROJECT_NAME} up -d --build

down:
	@docker compose -f ${COMPOSE_FILE_PATH} -p ${PROJECT_NAME} down --remove-orphans

create_volume_folders:
	mkdir -p ${VOLUME_PATH}/wordpress
	mkdir -p ${VOLUME_PATH}/mariadb

delete_volume_folders:
	rm -rf ${VOLUME_PATH}

clean: down delete_volume_folders clean_all
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

# Clean all Docker resources
clean_all:
	@echo "Cleaning up Docker resources..."
	@echo "Stopping containers..."
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@echo "Removing containers..."
	@docker rm $$(docker ps -qa) 2>/dev/null || true
	@echo "Removing images..."
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@echo "Removing volumes..."
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@echo "Removing networks..."
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@echo "\033[32mAll Docker resources have been cleaned.\033[0m"


.PHONY: all up down create_volume_folders clean re nginx wordpress mariadb clean_all
