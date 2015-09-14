#!/bin/bash

## Script dependencies
# duplicity
# gnupg

GPGPASS=$(cat [/path/to/gpg_passphrase])

PASSPHRASE=$GPGPASS /usr/bin/duplicity verify \
    --verbosity info \
    --encrypt-sign-key [SHORT GPG KEYID]] \
    file://[/backup/path] [/datasrc/path]
