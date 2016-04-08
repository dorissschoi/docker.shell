#!/bin/sh

file=$(readlink -f "$0")
. $(dirname $file)/lib.sh
dir="${root}/nginx"

image="nginx"
name="${1:+--name $1}"
vol="-v ${dir}/conf/nginx.conf:/etc/nginx/nginx.conf -v ${dir}/conf/conf.d:/etc/nginx/conf.d -v ${dir}/ssl/nginx.key:/etc/ssl/private/nginx.key -v ${dir}/ssl/nginx.pem:/etc/ssl/certs/nginx.pem -v ${dir}/log:/var/log/nginx -v ${dir}/www:/var/www"
port="-p 80:80 -p 443:443"

docker_run