#!/bin/sh


sf_sh_volumes()
{
  volumes=
  test ! -e /etc/localtime ||
    volumes=" --volume $(realpath /etc/localtime):/etc/localtime:ro"
  test ! -e /srv/project-local/node-sitefile/.git ||
    volumes=" --volume /srv/project-local/node-sitefile/tools/docker/ubuntu/entry.sh:/usr/local/share/sitefile/entry.sh"
}

wait_for_container()
{
  while true
  do
    docker ps | grep " \<$1\>" || { sleep .2; continue; }
    break
  done
}
