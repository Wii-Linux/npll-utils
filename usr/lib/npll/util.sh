#!/bin/sh
ver="v0.1.0"
log() {
	echo "$@" >&2
}

# mistake-proofing!  Printf won't like multiple args that are just strings.
# although we shouldn't be passing multiple args like that,
# protect against it anyways.
#
# We also can't just pass the escape sequences to echo directly,
# (at least, not in a POSIX compliant `sh`), so we need to use
# printf for the color.
warn() {
	printf "\x1b[1;33m" >&2
	echo "$@" >&2
	printf "\x1b[0m" >&2
}

error() {
	printf "\x1b[1;31m" >&2
	echo "$@" >&2
	printf "\x1b[0m" >&2
}

version() {
	log "$progname, part of gumboot-utils $ver"
	exit 0
}

# FIXME: hacky implementation of long arguments
if [ "$1" = "--version" ]; then version; fi
if [ "$1" = "--help" ]; then usage; fi


starting() {
	log "$progname, part of gumboot-utils $ver, starting up..."
}

cd /
