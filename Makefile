
DATA_DIR = /home/${USER}/sgoinfre/${USER}/francinette-light
DOCKER-COMPOSE = docker-compose -f docker-compose.yml
USERNAME = $(shell whoami)

all: build up 

env:
	@echo "Setting up environment..."
	@echo "DATA_DIR=${DATA_DIR}" > .env
	@echo "USERNAME=${USERNAME}" >> .env

build: env
	@echo "Building francinette light..."
	$(DOCKER-COMPOSE) build

up:
	@echo "Starting francinette light..."
	@if [ -z "${DATA_DIR}" ]; then \
		echo "Error: DATA_DIR is not set"; \
		exit 1; \
	fi
	$(DOCKER-COMPOSE) up -d

down:
	@echo "Stopping francinette light..."
	$(DOCKER-COMPOSE) down --rmi all

logs:
	@echo "Showing logs..."
	$(DOCKER-COMPOSE) logs -f

clean: down
	@echo "Removing francinette light..."
	${DOCKER_COMPOSE} down -v --rmi all --remove-orphans || true

fclean: clean
	@echo "Removing all stopped containers..."
	docker system prune -f &

shell:
	@echo "Starting shell..."
	docker exec -it francinette-light zsh

uninstall:
	@echo "Uninstalling francinette light..."
	rm -rf ${DATA_DIR}

re: fclean build up

.PHONY: build up down clean fclean re