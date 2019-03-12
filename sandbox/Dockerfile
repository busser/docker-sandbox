FROM docker:18.09.2

RUN apk add --no-cache \
    bash \
    git \
    iptables \
    make \
    nano \
    ncurses \
    python3 \
    supervisor \
    vim

# Install Docker Compose
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir docker-compose

# Change default shell from ash to bash
RUN sed -i -e 's/bin\/ash/bin\/bash/' /etc/passwd

COPY files/ /

# Required to run Docker in Docker
VOLUME /var/lib/docker

WORKDIR /root

ENTRYPOINT ["/usr/bin/supervisord", "--nodaemon"]
