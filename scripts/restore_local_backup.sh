#!/bin/bash

## Script dependencies
# duplicity
# gnupg

GPGPASS=$(cat [/path/to/gpg_passphrase])

PASSPHRASE= SIGN_PASSPHRASE=$GPGPASS /usr/bin/duplicity \
    --volsize=500 \
    --encrypt-sign-key [SHORT GPG KEYID] \
    file://[/backup/path] [/restore/path]
