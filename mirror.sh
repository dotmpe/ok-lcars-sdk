#!/bin/sh
set -e

hostname=$(hostname)

httrack http://$hostname:7011 -O mirror "+*.$hostname/*"

rsync -avzui --delete \
  ./mirror/${hostname}_7011/ ../bvberkum.github.io/ok-lcars-sdk
