#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "No port specified"
    exit 1
fi

PORT=$1
echo "Checking health on port $PORT"

curl -f http://localhost:$PORT/health || exit 1
echo "Health check passed"
