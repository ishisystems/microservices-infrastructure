#!/bin/bash
set -e

if [ "$1" = 'elasticsearch' ]; then
	chown -R elasticsearch:elasticsearch /opt/elasticsearch
	exec gosu elasticsearch "$@"
fi

exec "$@"