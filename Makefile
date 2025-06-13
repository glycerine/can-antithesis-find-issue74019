.PHONY: all rebuild clean chaos

all:
	docker compose -f docker-compose.json up

rebuild:
	docker compose -f docker-compose.json up --build

clean:
	docker compose -f docker-compose.json down
	docker compose -f docker-compose.json build --no-cache

chaos:
	docker compose -f docker-compose.json run app bash -c "rr record -h ./rpc.go1.25rc1.test && rr pack"

logs:
	docker logs can-antithesis-find-issue74019-app-run-e3d1d1eb0779
