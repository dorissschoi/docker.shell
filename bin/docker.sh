#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/docker"

vol="${vol} -v ${dir}/image:/var/lib/docker -v ${root}:/root"
port="-p 2375:2375 -e PORT=2375 -p 80:80 -p 53:53/udp -p 53:53/tcp --dns=127.0.0.1"

docker run --privileged -d ${env} ${port} ${vol} --name $1 docker:dind