#!/bin/sh
printf '%s' "$OF_KEY" > /tmp/of.key
mkdir -p /tmp/www && echo ok > /tmp/www/index.html
busybox httpd -f -p "${PORT:-8080}" -h /tmp/www &
export TELEMOST_STRIPES="${TELEMOST_STRIPES:-6}"
exec /openflux --role=exit --mode=l4 --transport=telemost --url "$OF_DOC" --encryption-key-file /tmp/of.key