#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"


tmpDir="$(mktemp -d /tmp/XXXXX)"


install_package "aria2" "aria2"


if ! package_is_installed "bat"; then

    downloadUrl="https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb"

    curl -fLo "$tmpDir/bat.deb" "$downloadUrl" &> /dev/null

fi
install_deb_package "bat" "bat" "$tmpDir/bat.deb"


install_package "cURL" "curl"


if [ ! -f "$HOME/bin/diff-so-fancy" ]; then
    wget -qO "$HOME/bin/diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy" &> /dev/null
fi
execute "chmod +x '$HOME/bin/diff-so-fancy'" \
        "diff-so-fancy"


if [ ! -f "$HOME/bin/exa" ]; then
    wget -qO "$tmpDir/exa.zip" "https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip" &> /dev/null \
        && unzip -qq -o -d "$tmpDir" "$tmpDir/exa.zip" \
        && cp -f "$tmpDir/exa-linux-x86_64" "$HOME/bin/exa"
fi
execute "chmod +x '$HOME/bin/exa'" \
        "exa"


if ! package_is_installed "fd"; then

    downloadUrl="https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb"

    curl -fLo "$tmpDir/fd.deb" "$downloadUrl" &> /dev/null

fi
install_deb_package "fd" "fd" "$tmpDir/fd.deb"


if ! package_is_installed "ffmpeg"; then

    add_ppa "jonathonf/ffmpeg-3" \
        || print_error "ffmpeg (add ppa)"

    update &> /dev/null \
        || print_error "ffmpeg (resync package index files)"

fi
install_package "ffmpeg" "ffmpeg libav-tools x264 x265"


install_package "glances" "glances"
install_package "htop" "htop"


if [ ! -f "$HOME/bin/prettyping" ]; then
    wget -qO "$HOME/bin/prettyping" "https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping" &> /dev/null
fi
execute "chmod +x '$HOME/bin/prettyping'" \
        "prettyping"


if ! package_is_installed "python3.6"; then

    add_ppa "deadsnakes/ppa" \
        || print_error "Python3 (add ppa)"

    update &> /dev/null \
        || print_error "Python3 (resync package index files)"

fi
install_package "Python3.6" "python3.6"

install_package "Pip3" "python3-pip"

execute "sudo -H pip3 install --upgrade pip" \
        "Pip3 upgrade"

execute "pip3 install --user pipenv" \
        "Pipenv"


if ! package_is_installed "rg"; then

    downloadUrl="https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb"

    curl -fLo "$tmpDir/rg.deb" "$downloadUrl" &> /dev/null

fi
install_deb_package "ripgrep (rg)" "rg" "$tmpDir/rg.deb"


install_package "ShellCheck" "shellcheck"
install_package "The Silver Searcher (ag)" "silversearcher-ag"
install_package "tree" "tree"
install_package "Vim" "vim"
install_package "xclip" "xclip"


if [ -d "$HOME/.nvm" ]; then

    if ! package_is_installed "yarn"; then

        add_key "https://dl.yarnpkg.com/debian/pubkey.gpg" \
            || print_error "Yarn (add key)"

        add_to_source_list "https://dl.yarnpkg.com/debian/ stable main" "yarn.list" \
            || print_error "Yarn (add to package resource list)"

        update &> /dev/null \
            || print_error "Yarn (resync package index files)"

    fi

    install_package "Yarn" "yarn" "--no-install-recommends"
fi

