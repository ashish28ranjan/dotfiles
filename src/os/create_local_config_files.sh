#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_bash_local() {

    declare -r FILE_PATH="$HOME/.bash.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then
        printf "%s\n\n" "#!/bin/bash" >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

create_gitconfig_local() {

    declare -r FILE_PATH="$HOME/.gitconfig.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        print_in_cyan "\n   Setting up Git local config...\n\n"

        defaultName=$( git config --global user.name )
        defaultEmail=$( git config --global user.email )

        print_in_yellow "   (Press ENTER to continue with [default], or type a new value and then press ENTER)\n"

        ask "Name:  [$defaultName] "
        tmpName="$(get_answer)"

        ask "Email: [$defaultEmail] "
        tmpEmail="$(get_answer)"


        printf "%s\n" \
"[user]
    name = ${tmpName:-$defaultName}
    email = ${tmpEmail:-$defaultEmail}
    # signingkey =

[gpg]
    # program = gpg2

[commit]
    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    # gpgsign = true
"\
        >> "$FILE_PATH"
    fi

    printf "\n"
    print_result $? "$FILE_PATH"

}

create_vimrc_local() {

    declare -r FILE_PATH="$HOME/.vimrc.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then
        printf "" >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

create_gpg_conf_local() {

    declare -r FILE_PATH="$HOME/.gnupg/gpg.conf.local"

    # Create the full folder structure
    mkdir -p "$(dirname $FILE_PATH)"
    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        printf "%s\n" \
"# If you have more than 1 secret key in your keyring, you may want to
# uncomment the following option and set your preferred keyid.

#default-key 0x12345678ABCD


# If you do not pass a recipient to gpg, it will ask for one.  Using
# this option you can encrypt to a default key.  Key validation will
# not be done in this case.  The second form uses the default key as
# default recipient.

#default-recipient some-user-id
#default-recipient-self


# Group names may be defined like this:
#   group mynames = paige 0x12345678 joe patti
#
# Any time 'mynames' is a recipient (-r or --recipient), it will be
# expanded to the names 'paige', 'joe', and 'patti', and the key ID
# '0x12345678'.  Note there is only one level of expansion - you
# cannot make an group that points to another group.  Note also that
# if there are spaces in the recipient name, this will appear as two
# recipients.  In these cases it is better to use the key ID.

#group mynames = paige 0x12345678 joe patti
"\
        >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

create_ssh_config_local() {

    declare -r FILE_PATH="$HOME/.ssh/config"
    declare -r FILE_PATH_EXAMPLE="$HOME/.ssh/config.example"

    # Create the full folder structure
    mkdir -p "$(dirname $FILE_PATH)"
    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    configData="Host *
  Port 22
  CheckHostIP yes
  HashKnownHosts yes
  StrictHostKeyChecking ask
  Ciphers chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr,3des-cbc,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-cbc,aes192-cbc,aes128-cbc
  Compression yes
  ConnectionAttempts 1
  PubkeyAuthentication yes
  RekeyLimit 100M 3600
  TCPKeepAlive yes


# Host example
#   User dev
#   HostName dev.example.com
#   IdentityAgent SSH_AUTH_SOCK
#   IdentityFile ~/.ssh/id_dsa
#   IdentityFile ~/.ssh/id_rsa
#   PasswordAuthentication no
#   UserKnownHostsFile ~/.ssh/known_hosts2
#   PermitLocalCommand yes
#   LocalCommand \"uname -a\"
#   RemoteCommand \"uname -a\"
"

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        printf "%s\n" "$configData"\
            >> "$FILE_PATH" \
            && print_result $? "$FILE_PATH"

    elif [ ! -e "$FILE_PATH_EXAMPLE" ] || [ -z "$FILE_PATH_EXAMPLE" ]; then

        printf "%s\n" "$configData"\
            >> "$FILE_PATH_EXAMPLE" \
            && print_result $? "$FILE_PATH_EXAMPLE"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Create local config files\n\n"

    create_bash_local
    create_gitconfig_local
    create_vimrc_local
    create_gpg_conf_local
    create_ssh_config_local

}

main
