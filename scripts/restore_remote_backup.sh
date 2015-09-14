#!/bin/bash

## Script dependencies
# duplicity
# gnupg
# OpenSSH client
# pycrypto (python-crypto package on Ubuntu)
# pip
# paramiko (pip package)

GPGPASS=$(cat [/path/to/gpg_passphrase])
SSHPASS=$(cat [/path/to/ssh_passphrase])

FTP_PASSWORD=$SSHPASS PASSPHRASE= SIGN_PASSPHRASE=$GPGPASS /usr/bin/duplicity \
    --encrypt-sign-key [SHORT GPG KEYID] \
    --ssh-options="-oIdentityFile=[/path/to/ssh_private_key]" \
    sftp://[user]@[ip]/[backupdir] [/restore/path]
