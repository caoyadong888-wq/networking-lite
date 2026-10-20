#!/usr/bin/env bash
# Turn the maintenance flag on or off, then reload nginx.
set -euo pipefail

flag=/etc/nginx/maintenance.flag
reload_cmd=""
action=${1:-}
if [[ $# -gt 0 ]]; then
  shift
fi

usage() {
  cat >&2 <<'EOF'
usage: maintenance.sh on|off|status [--flag PATH] [--reload-cmd CMD]
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --flag)
      flag=${2:?missing flag path}
      shift 2
      ;;
    --reload-cmd)
      reload_cmd=${2:?missing reload command}
      shift 2
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      echo "unknown argument: $1" >&2
      usage
      exit 2
      ;;
  esac
done

reload_nginx() {
  if [[ -n $reload_cmd ]]; then
    bash -c "$reload_cmd"
  else
    nginx -s reload
  fi
}

case "$action" in
  on)
    mkdir -p -- "$(dirname "$flag")"
    touch -- "$flag"
    echo "maintenance on: $flag"
    reload_nginx
    ;;
  off)
    rm -f -- "$flag"
    echo "maintenance off: $flag"
    reload_nginx
    ;;
  status)
    if [[ -f $flag ]]; then
      echo "on"
    else
      echo "off"
    fi
    ;;
  *)
    usage
    exit 2
    ;;
esac
