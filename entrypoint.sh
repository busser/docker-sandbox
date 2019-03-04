#!/bin/sh
set -e

dockerd-entrypoint.sh "$@" >/dev/null 2>&1 &

exec /bin/bash --login
