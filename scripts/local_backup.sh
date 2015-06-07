#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR/utils.sh"


GPG_KEYID=<FILL SHORT KEY ID>
GPG_PASSPHRASE_FILE=<FILL PATH>

BACKUP_SRC=<FILL PATH>
BACKUP_DST=<FILL PATH>


function local_backup {
    PASSPHRASE= SIGN_PASSPHRASE=$(cat $GPG_PASSPHRASE_FILE) duplicity --volsize=500 --encrypt-sign-key $GPG_KEYID "$1" "file://$2"
}

function preliminary_checks {
    assert_program_installed gpg
    assert_program_installed duplicity

    assert_key_in_keyring $GPG_KEYID

    assert_path_reachable "$GPG_PASSPHRASE_FILE"
    assert_path_reachable "$BACKUP_SRC"
    assert_path_reachable "$BACKUP_DST"
}


preliminary_checks
echo "all checks passed, starting local backup..."
echo
local_backup "$BACKUP_SRC" "$BACKUP_DST"
