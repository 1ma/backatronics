#!/bin/bash

function echoerr {
    echo "$@" 1>&2;
}

function assert_program_installed {
    if ! type "$1" > /dev/null 2>&1; then
        echoerr "binary $1: not found! Aborting script"
        exit 1
    fi

    echoerr "binary $1: found"
}

function assert_key_in_keyring {
    if ! gpg --list-secret-keys "$1" > /dev/null 2>&1; then
        echoerr "GPG key $1: not available! Aborting script"
        exit 1
    fi

    echoerr "GPG key $1: available"
}

function assert_path_reachable {
    if [ ! -e "$1" ]; then
        echoerr "$1: path unreachable! Aborting script"
        exit 1
    fi

    echoerr "path $1: reachable"
}
