# Docker Sandbox

A sandbox generator that provides isolated environments where developers can
try out Docker from their web browser.

## Prerequisites

1. [Docker](https://www.docker.com/) must be installed.
2. [GoTTY](https://github.com/yudai/gotty) must be installed.
3. [Python 3](https://www.python.org/) must be installed.

## Usage

Start by building the `docker-sandbox` Docker image. A container will be
created from this image each time a user connects to the web page.

```bash
make build
```

Now, run the web server:

```bash
make run
```

Users can now go to port 8080 to use a Docker sandbox.

> Use `Ctrl+C` to exit GoTTY, disconnecting any users from their sandbox.

~~Due to a [bug](https://github.com/yudai/gotty/issues/88) in GoTTY caused by
an upstream [issue](https://github.com/moby/moby/issues/28872) in Docker,
sandboxes that are not exited before the user closes their browser window will
leave a running Docker container on your server.~~ This project now works
around this issue by removing sandbox containers when the client closes the
connection.

This should not be necessary, but you can clean up any remaining containers:

```bash
make clean
```
