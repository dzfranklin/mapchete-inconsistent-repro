#!/usr/bin/env bash
set -euox pipefail

docker build . --load -t mapchete-inconsistent-repro
docker run --rm -p 5050:5000 --name mapchete-inconsistent-repro mapchete-inconsistent-repro &

sleep 5

TILE="http://localhost:5050/wmts_simple/1.0.0/repro/default/g/12/1278/2010.png"
curl "$TILE" --fail -o a.png
sleep 1
curl "$TILE" --fail -o b.png

#docker stop mapchete-inconsistent-repro
