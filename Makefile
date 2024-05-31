all : 
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop :
	docker-compose -f ./srcs/docker-compose.yml down

clean :
	docker-compose -f ./srcs/docker-compose.yml down -t 1
	docker system prune -af
	-docker volume rm mariadb
	-docker volume rm wordpress

re : clean all