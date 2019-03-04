default: clean build run

build:
	docker build --tag docker-sandbox .

run:
	gotty \
		--config gotty/config \
		docker run \
			--interactive \
			--tty \
			--label docker-sandbox \
			--privileged \
			docker-sandbox

clean:
	for container_id in $$(docker ps --all --quiet --filter label=docker-sandbox); do \
		docker rm --force --volumes $$container_id; \
	done
