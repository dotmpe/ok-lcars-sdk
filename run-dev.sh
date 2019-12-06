#!/bin/sh
set -e

# dev mode (ro); mount local source, also use latest sitefile entry.sh iso. built-in

#script_dir=/opt/node-sitefile
#  --volume $script_dir/tools/docker/ubuntu/entry.sh:/usr/local/share/sitefile/entry.sh:ro \

sf_version=0.0.7-dev

# r/o so don't touch git or npm
src_update=0

site_src=github.com/bvberkum/ok-lcars-sdk
site_repo=git@$site_src.git
site_ver=master

gh_keyfile=~/.ssh/id_rsa
kbn=id_rsa

hostname=$(hostname)

mkdir -p srv
ssh-keyscan github.com > srv/known_hosts

. ./lib.sh

sf_sh_volumes
#volumes="$volumes --volume $(pwd -P)/srv/src:/src"
#volumes="$volumes --volume $(pwd -P)/srv/home:/home/treebox"
set -x
docker run \
  -d --name sf-ok-lcars-sdk-dev \
  -h $hostname -e SITEFILE_HOST=$hostname \
  -p 7011:7011 -e SITEFILE_PORT=7011 \
  -e src_update=$src_update \
  $volumes \
  --volume $(realpath $gh_keyfile):/home/treebox/.ssh/$kbn \
  --volume $(realpath ./srv/known_hosts):/home/treebox/.ssh/known_hosts \
  --volume $(realpath $(pwd)):/src/$site_src:ro \
  bvberkum/node-sitefile:$sf_version \
  \
  "$site_src" "$site_repo" "$site_ver"
