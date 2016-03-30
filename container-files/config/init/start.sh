#!/bin/sh
set -eu
export TERM=xterm
# Bash Colors
green=`tput setaf 2`
bold=`tput bold`
reset=`tput sgr0`
log() {
  if [[ "$@" ]]; then echo "${bold}${green}[LOG `date +'%T'`]${reset} $@";
  else echo; fi
}
log "Creating Cache directory for nginx"
mkdir -p /var/lib/nginx/
log "Starting GitBucket"
