build:
	./install.sh

clean:
	docker stop $(docker ps -a -q) || true
	docker rm $(docker ps -a -q) || true
	docker rmi $(docker images -q) || true
	rm -rf /home/${USER}/goinfre/${USER}/francinette-light

fclean: clean
	docker system prune -f

re: fclean build

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker rmi $(docker images -q)
# docker volume rm $(docker volume ls -q)
