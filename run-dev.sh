#!/bin/sh
# shellcheck disable=SC2086
# SC2086: 'volumes' is unquoted intentionally
set -e

# dev mode (ro); mount local source, XXX: also use latest sitefile entry.sh iso. built-in

sf_version=0.0.7-dev
#sf_version=0.0.7-test
#sf_version=latest

# r/o so don't touch git or npm
src_update=0

site_src=github.com/dotmpe/ok-lcars-sdk
#site_repo=git@$site_src.git
#site_ver=r0.0

gh_keyfile=~/.ssh/id_rsa
kbn=id_rsa

hostname=$(hostname)
#hostnamef=$(hostname -f)

mkdir -p srv
ssh-keyscan github.com > srv/known_hosts

. ./lib.sh

volumes=
port=4508
sf_sh_volumes
#volumes="$volumes --volume $(pwd -P)/srv/src:/src"
#volumes="$volumes --volume $(pwd -P)/srv/home:/home/treebox"
sf_dir=/srv/project-local/node-sitefile
test ! -e $sf_dir/.git ||
  volumes="$volumes --volume $sf_dir/tools/docker/ubuntu/entry.sh:/usr/local/share/sitefile/entry.sh:ro"

volumes="$volumes --volume /srv/scm-git-25-5-t460s-mpe/:/srv/scm-git-25-5-t460s-mpe/"

set -x
docker run \
  -d --name sf-ok-lcars-sdk-dev \
  -h $hostname -e SITEFILE_HOST=$hostname \
  -p $port:$port -e SITEFILE_PORT=$port \
  -e src_update=$src_update \
  $volumes \
  --volume "$(realpath $gh_keyfile)":/home/treebox/.ssh/$kbn \
  --volume "$(realpath ./srv/known_hosts)":/home/treebox/.ssh/known_hosts \
  --volume "$(pwd -P)":/src/$site_src:ro \
  dotmpe/node-sitefile:$sf_version \
  \
  "$site_src"

# Id:
