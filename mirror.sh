#!/bin/sh
set -e

hostname=$(hostname)

# dev
port=7011
# ht pm2 'sf-ok-lcars-sdk'
port=4507

httrack http://$hostname:$port -O mirror "+*.$hostname/*"

rsync -avzui --delete \
  ./mirror/${hostname}_$port/ ../bvberkum.github.io/ok-lcars-sdk
