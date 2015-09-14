#!/bin/bash

## Script dependencies
# duplicity
# gnupg

GPGPASS=$(cat [/path/to/gpg_passphrase])

PASSPHRASE= SIGN_PASSPHRASE=$GPGPASS /usr/bin/duplicity \
    --encrypt-sign-key [SHORT GPG KEYID] \
    file://[/backup/path] [/restore/path]
