#!/usr/bin/env zsh

set -e

usage() {
    echo "Usage: $0 {save|restore} DOMAIN PLIST" >&2
    exit 2
}

(( $# == 3 )) || usage

action=$1
domain=$2
settings=$3

case "$action" in
    save)
        defaults export "$domain" "$settings"
        plutil -convert xml1 "$settings"
        ;;
    restore)
        defaults import "$domain" "$settings"
        ;;
    *)
        usage
        ;;
esac
