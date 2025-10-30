#!/usr/bin/env bash
set -euo pipefail
docker build -t my-dev-app -f 4-dev-app.dockerfile .
docker run --rm -p 3000:3000 my-dev-app
