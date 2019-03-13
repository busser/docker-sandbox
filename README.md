# Docker Sandbox

A sandbox generator that provides isolated environments where developers can
try out Docker from their web browser.

## Prerequisites

1. [Docker](https://www.docker.com/) must be installed.
2. [Python >=3.5](https://www.python.org/) must be installed.

## Usage

Start by building the `docker-sandbox` Docker image. A container will be
created from this image each time a user connects to the web page.

```bash
make build-sandbox
```

Next, build the `docker-sandbox-server` Docker image. This will run a web
server that will create the sandboxes.

```bash
make build-server
```

Now, run the web server:

```bash
make run
```

> This will fail if the web server is already running. In that case, use
> `make clean-server run` instead.

Users can now go to port 8080 to use a Docker sandbox.

When you want to stop the server, run:

```bash
make clean-server
```

If the server stops unexpectedly, you may need to clean up any remaining
sandbox containers:

```bash
make clean-sandbox
```
