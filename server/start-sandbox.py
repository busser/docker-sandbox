#!/usr/bin/env python3

import os
import signal
import socket
import subprocess

# Define the number of ports to publish for each sandbox instance.
num_ports = 3


# get_unused_port returns an unused port
def get_unused_port() -> int:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('', 0))
    port = s.getsockname()[1]
    s.close()
    return port

ports_to_publish = sorted([
    get_unused_port() 
    for _ in range(num_ports)
])

docker_publish_args = []
for p in ports_to_publish:
    docker_publish_args.append('--publish')
    docker_publish_args.append('{port}:{port}'.format(port=p))

# Create sandbox container in background and store its ID.
docker_run_command = [
    'docker', 'run',
    '--detach',
    '--label', 'docker-sandbox',
    '--privileged',
] + docker_publish_args + [
    '--env', 'PUBLISHED_PORTS=' + ' '.join([str(p) for p in ports_to_publish]),
    'docker-sandbox'
]
container_id = subprocess.check_output(
    docker_run_command,
    stderr=subprocess.STDOUT,
).strip()

docker_rm_command = [
    'docker', 'rm',
    '--force',
    '--volumes',
    container_id,
]

# Handle SIGHUP signal sent by GoTTY when connection is closed by client.
def handle_signal(sig, frame):
    subprocess.run(
        docker_rm_command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
signal.signal(signal.SIGHUP, handle_signal)

# Create shell inside container.
docker_exec_command = [
    'docker', 'exec',
    '--interactive',
    '--tty',
    container_id,
    'bash', '--login',
]
docker_exec_output = subprocess.run(
    docker_exec_command,
    stderr=subprocess.STDOUT,
)

# Remove container when shell is closed.
subprocess.run(
    docker_rm_command,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE
)

