FROM golang:alpine AS gotty-builder
RUN apk add --no-cache git mercurial
RUN go get github.com/yudai/gotty

FROM docker
RUN apk add --no-cache python3
COPY --from=gotty-builder /go/bin/gotty /usr/local/bin/
COPY start-sandbox.py .
CMD ["gotty", "--permit-write", "--title-format", "Docker Sandbox", "python3", "start-sandbox.py"]
