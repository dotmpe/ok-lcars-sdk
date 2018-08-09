#!/bin/sh
set -e

sf_version=0.0.7-dev

site_src=github.com/bvberkum/ok-lcars-sdk
#site_repo=http://$site_src
site_ver=

hostname=$(hostname)

ssh-keyscan github.com > known_hosts

set -x
docker run \
  -d --name sf-ok-lcars-sdk \
  -h $hostname -e SITEFILE_HOST=$hostname \
  -p 7010:7010 -e SITEFILE_PORT=7010 \
  -e src_update=$src_update \
  --volume $(realpath ./known_hosts):/home/treebox/.ssh/knownhosts \
  --volume $(realpath /etc/localtime):/etc/localtime:ro \
  bvberkum/node-sitefile:$sf_version \
  \
  "$site_src" "$site_repo" "$site_ver"
