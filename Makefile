all:	
	cd srcs/ && sudo docker-compose build
	sudo mkdir -p /home/ablondel/data /home/ablondel/data/wordpress /home/ablondel/data/database
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 ablondel.42.fr" >> /etc/hosts
	sudo echo "127.0.0.1 www.ablondel.42.fr" >> /etc/hosts
	cd srcs/ && sudo docker-compose up -d
clean:
	cd srcs/ && sudo docker-compose down -v --rmi all --remove-orphans
	sudo docker system prune --volumes --all --force
	sudo rm -rf /home/ablondel/data
	sudo docker network prune --force
	sudo docker image prune --force

re:
	fclean all

.PHONY : all clean re
