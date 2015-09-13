#!/bin/bash

## Script dependencies
# duplicity
# OpenSSH client
# gnupg
# pycrypto (python-crypto package on Ubuntu)
# pip
# paramiko (pip package)

GPGPASS=$(cat [/path/to/gpg_passphrase])
SSHPASS=$(cat [/path/to/ssh_passphrase])

FTP_PASSWORD=$SSHPASS PASSPHRASE= SIGN_PASSPHRASE=$GPGPASS /usr/bin/duplicity \
    --volsize=500 \
    --encrypt-sign-key [SHORT GPG KEYID] \
    --ssh-options="-oIdentityFile=[/path/to/ssh_private_key]" \
    [/source/path] sftp://[user]@[ip]/[directory]
