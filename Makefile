default: clean build run

build:
	docker build --tag docker-sandbox .

run:
	gotty \
		--config gotty/config \
		python3 start-sandbox.py

clean:
	for container_id in $$(docker ps --all --quiet --filter label=docker-sandbox); do \
		docker rm --force --volumes $$container_id; \
	done
