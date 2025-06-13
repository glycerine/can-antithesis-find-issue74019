.PHONY: all rebuild clean

all:
	docker compose -f docker-compose.json up

rebuild:
	docker compose -f docker-compose.json up --build

clean:
	docker compose -f docker-compose.json down
	docker compose -f docker-compose.json build --no-cache
