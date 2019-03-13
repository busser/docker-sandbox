default: clean build run

build: build-sandbox build-server

build-sandbox:
	docker build --tag docker-sandbox sandbox/

build-server:
	docker build --tag docker-sandbox-server server/


run:
	docker run \
		--detach \
		--label docker-sandbox-server \
		--mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock \
		--publish 8080:8080 \
		docker-sandbox-server


clean: clean-server clean-sandbox

clean-sandbox:
	for container_id in $$(docker ps --all --quiet --filter label=docker-sandbox); do \
		docker stop $$container_id; \
		docker rm --volumes $$container_id; \
	done

clean-server:
	for container_id in $$(docker ps --all --quiet --filter label=docker-sandbox-server); do \
		docker stop $$container_id; \
		docker rm --volumes $$container_id; \
	done
