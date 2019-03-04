FROM docker:18.09.2-dind

RUN apk add --no-cache \
    bash \
    make \
    nano \
    ncurses \
    python3 \
    vim

# Install Docker Compose
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir docker-compose

# Change default shell from ash to bash
RUN sed -i -e 's/bin\/ash/bin\/bash/' /etc/passwd

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

COPY files/ /

WORKDIR /root
