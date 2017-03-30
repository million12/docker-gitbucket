#!/bin/sh
set -eu
export TERM=xterm
echo "Creating Cache directory for nginx"
mkdir -p /var/lib/nginx/
echo "Starting GitBucket"
