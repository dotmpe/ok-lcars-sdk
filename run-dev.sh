#!/bin/sh
set -e

# dev mode (ro); mount local source, also use latest sitefile entry.sh iso. built-in

script_dir=/opt/node-sitefile

sf_version=0.0.7-dev

# r/o so don't touch git or npm
src_update=0

site_src=github.com/bvberkum/ok-lcars-sdk
#site_repo=http://$site_src
site_ver=

hostname=$(hostname)

set -x
docker run \
  -d --name sf-ok-lcars-sdk \
  -h $hostname -e SITEFILE_HOST=$hostname \
  -p 7011:7011 -e SITEFILE_PORT=7011 \
  -e src_update=$src_update \
  --volume $script_dir/tools/docker/ubuntu/entry.sh:/usr/local/share/sitefile/entry.sh:ro \
  --volume $(realpath /etc/localtime):/etc/localtime:ro \
  --volume $(realpath $(pwd)):/src/$site_src:ro \
  bvberkum/node-sitefile:$sf_version \
  \
  "$site_src" "$site_repo" "$site_ver"
