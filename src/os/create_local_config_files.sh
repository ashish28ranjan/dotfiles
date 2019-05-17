#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_assh_local() {

    declare -r FILE_PATH="$HOME/.ssh/assh.local.yml"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then
        printf "%s\n" \
"templates:
  # Templates are similar to Hosts; you can inherit from them
  # but you cannot ssh to a template
  gpg-agent-template:
    RemoteForward: $HOME/.gnupg/S.gpg-agent $HOME/.gnupg/S.gpg-agent.extra


hosts:

  example:
    HostName: example.com
    User: johndoe
    Inherits:
    - gpg-agent-template
"\
        >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

create_bash_local() {

    declare -r FILE_PATH="$HOME/.bash.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then
        printf "%s\n\n" "#!/bin/bash" >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

create_gitconfig_local() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skipQuestions=false

    skip_questions "$1" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    declare -r FILE_PATH="$HOME/.gitconfig.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        print_in_cyan "\n   Setting up Git local config...\n\n"

        defaultName=$( git config --global user.name )
        defaultEmail=$( git config --global user.email )

        print_in_yellow "   (Press ENTER to continue with [default], or type a new value and then press ENTER)\n"

        tmpName=""
        tmpEmail=""

        if ! "$skipQuestions"; then
            ask "Name:  [$defaultName] "
            tmpName="$(get_answer)"

            ask "Email: [$defaultEmail] "
            tmpEmail="$(get_answer)"
        fi

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

    print_result $? "$FILE_PATH"

}

create_vimrc_local() {

    declare -r FILE_PATH="$HOME/.vimrc.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then
        printf "%s\n" \
"\" ----------------------------------------------------------------------
\" | Plugins - nvim-python                                               |
\" ----------------------------------------------------------------------

\" Set the path to the python executables

let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'
"\
        >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

create_gpg_conf_local() {

    declare -r FILE_PATH="$HOME/.gnupg/gpg.conf.local"

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

    declare -r FILE_PATH="$HOME/.ssh/config.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        printf "%s\n" \
"# Host example
#   HostName example.com
#   User johndoe
#   IdentityAgent SSH_AUTH_SOCK
#   IdentityFile ~/.ssh/id_rsa
#   PermitLocalCommand yes
#   LocalCommand \"uname -a\"
#   RemoteCommand \"uname -a\"
"\
        >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Create local config files\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    create_assh_local
    create_bash_local
    create_gitconfig_local "$@"
    create_gpg_conf_local
    create_ssh_config_local
    create_vimrc_local

}

main "$@"
