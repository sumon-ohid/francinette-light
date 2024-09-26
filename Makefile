build:
	./install.sh

clean:
	@if [ -n "$$(docker ps -a -q)" ]; then docker stop $$(docker ps -a -q); fi
	@if [ -n "$$(docker ps -a -q)" ]; then docker rm $$(docker ps -a -q); fi
	@if [ -n "$$(docker images -q)" ]; then docker rmi $$(docker images -q); fi
	rm -rf /home/${USER}/goinfre/${USER}/francinette-light

fclean: clean
	docker system prune -f

re: fclean build

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker rmi $(docker images -q)
# docker volume rm $(docker volume ls -q)