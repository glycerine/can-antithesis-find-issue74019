.PHONY: all rebuild clean chaos logs cptrace

all:
	docker compose -f docker-compose.json up

rebuild:
	docker compose -f docker-compose.json up --build

clean:
	docker compose -f docker-compose.json down
	docker compose -f docker-compose.json build --no-cache

chaos:
	docker compose -f docker-compose.json run app bash -c "rr record -h ./rpc.go1.25rc1.test ; rr pack"

synctest:
	docker compose -f docker-compose.json run app bash -c "GOTRACEBACK=all GOEXPERIMENT=synctest ./rpc.go1.25rc1.test | tee ./log.synctest.txt"


chaos_synctest:
	docker compose -f docker-compose.json run app bash -c "GOTRACEBACK=all GOEXPERIMENT=synctest rr record -h ./rpc.go1.25rc1.test ; rr pack"

logs:
	docker logs 005d38f4341b

cptrace:
	docker cp 005d38f4341b:/root/.local/share/rr ./chaos-synctest2-rr-trace

