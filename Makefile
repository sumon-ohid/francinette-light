build:
	./install.sh

clean:
	docker stop francinette-light || true
	docker rm francinette-light || true
	docker rmi francinette-light || true

fclean: clean
	docker system prune -f
	docker volume prune -f
	docker network prune -f
	docker image prune -f
	docker container prune -f

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker rmi $(docker images -q)
# docker volume rm $(docker volume ls -q)
