default: build

build:
	docker build --tag docker-sandbox .

clean:
	for container_id in $$(docker ps --all --quiet --filter label=docker-sandbox); do \
		docker rm --force --volumes $$container_id; \
	done
