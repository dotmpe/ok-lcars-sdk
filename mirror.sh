#!/usr/bin/env bash
hostname=$(hostname)

# dev
: "${port:=7011}"

# ht pm2 'sf-ok-lcars-sdk'
#port=4507

set -xe

httrack "http://$hostname:$port" -O mirror "+*.$hostname/*"

rsync -avzui --delete \
  ./mirror/"${hostname}_$port"/ ../dotmpe.github.io/ok-lcars-sdk

#
