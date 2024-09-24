DATA_DIR = /home/${USER}/sgoinfre/${USER}/francinette-light

build:
	@echo "Building francinette light..."
	docker build -t francinette-light .

up:
	@echo "Starting francinette light..."
	@if [ -z "${DATA_DIR}" ]; then \
		echo "Error: DATA_DIR is not set"; \
		exit 1; \
	fi
	docker run -d --name francinette-light -v ${DATA_DIR}:/data francinette-light

down:
	@echo "Stopping francinette light..."
	docker stop francinette-light || true

logs:
	@echo "Showing logs..."
	docker logs -f francinette-light

clean: down
	@echo "Removing francinette light..."
	docker rm francinette-light || true
	docker rmi francinette-light || true

fclean: clean
	@echo "Removing all stopped containers..."
	docker system prune -f &

shell:
	@echo "Starting shell..."
	docker run -it --rm francinette-light /bin/zsh

re: fclean build up

.PHONY: build up down clean fclean re