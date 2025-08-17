all:
	@mkdir -p ~/data/mariadb ~/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

down:
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down all

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data

fclean: clean
	@docker stop $$(docker ps -qa) || true
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all down re clean fclean