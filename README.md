# Docker Sandbox

A sandbox generator that provides isolated environments where developers can
try out Docker from their web browser.

## Prerequisites

1. [Docker](https://www.docker.com/) must be installed.
2. [Docker Compose](https://docs.docker.com/compose/) must be installed.

## Usage

Start by building the `docker-sandbox` Docker image. A container will be
created from this image each time a user connects to the web page.

```bash
make --directory sandbox/ build
```

Next, build the `docker-sandbox-server` Docker image. This will run a web
server that will create the sandboxes.

```bash
docker-compose build
```

Now, run the web server:

```bash
docker-compose up
```

> This will (re-)build the server image.

Users can now go to port 8080 to use a Docker sandbox.

When you want to stop the server, run:

```bash
docker-compose down
```

If the server stops unexpectedly, you may need to clean up any remaining
sandbox containers:

```bash
make --directory sandbox/ clean
```
