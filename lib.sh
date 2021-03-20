#!/bin/sh


sf_sh_volumes()
{
  # shellcheck disable=SC2034  # Variable is used globally
  volumes=
  test ! -e /etc/localtime ||
    volumes=" --volume $(realpath /etc/localtime):/etc/localtime:ro"
}

wait_for_container()
{
  test -n "$1" || return
  while true
  do
    docker ps | grep " \<$1\>" || { sleep .2; continue; }
    break
  done
}

#
