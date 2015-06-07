#!/bin/bash

# Dependencies: duplicity, gpg
PASSPHRASE= SIGN_PASSPHRASE=$(cat [/path/to/gpg_passphrase]) /usr/bin/duplicity \
    --volsize=500 \
    --encrypt-sign-key [SHORT GPG KEYID] \
    [/source/path] file://[/dest/path]
