#!/bin/bash

# Dependencies: duplicity, gpg, pycrypto (python-crypto on Ubuntu), pip, paramiko (pip package)
PASSPHRASE= SIGN_PASSPHRASE=$(cat [/path/to/gpg_passphrase]) /usr/bin/duplicity \
    --volsize=500 \
    --encrypt-sign-key [SHORT GPG KEYID] \
    --ssh-options="-oIdentityFile=[/path/to/ssh_private_key]" \
    [/source/path] sftp://[user]@[ip]/[directory]
