#!/bin/sh
# shellcheck disable=SC2086
# SC2086: 'volumes' is unquoted intentionally
set -e

# FIXME: setup submodules for non-dev? This won't be able to checkout project
# submodules. Instead mount local checkout as read-only.
#  --env src_submodules=0 \
# See run-dev.sh for sitefile server.

sf_version=0.0.7-dev

site_src=github.com/dotmpe/ok-lcars-sdk
#site_repo=http://$site_src
site_ver=master

hostname="$(hostname)"

. ./lib.sh

sf_sh_volumes
volumes="$volumes --volume $(pwd -P):/src/$site_src:ro"
set -x
docker run \
  -d --name sf-ok-lcars-sdk \
  --env src_update=0 \
  -h "$hostname" -e SITEFILE_HOST="$hostname" \
  -p 7010:7010 -e SITEFILE_PORT=7010 \
  $volumes \
  dotmpe/node-sitefile:"$sf_version" \
  \
  "$site_src" "${site_repo-}" "$site_ver"
set +x
wait_for_container sf-ok-lcars-sdk
echo "Sitefile server running" >&2

#
