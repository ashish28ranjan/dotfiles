#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"


tmpDir="$(mktemp -d /tmp/XXXXX)"


install_package "aria2" "aria2"

install_binary "assh" \
    "https://github.com/moul/assh/releases/download/v2.8.0/assh_linux_amd64"


if ! package_is_installed "bat"; then

    downloadUrl="https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb"

    curl -fLo "$tmpDir/bat.deb" "$downloadUrl" &> /dev/null

fi
install_deb_package "bat" "bat" "$tmpDir/bat.deb"


install_package "cURL" "curl"

install_binary "diff-so-fancy" \
    "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"


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


if [ ! -f "$HOME/bin/hub" ]; then
    wget -qO "$tmpDir/hub.tgz" "https://github.com/github/hub/releases/download/v2.12.0/hub-linux-amd64-2.12.0.tgz" &> /dev/null \
        && tar -xz -C "$tmpDir" -f "$tmpDir/hub.tgz" \
        && cp -f "$tmpDir/hub-linux-amd64-2.12.0/bin/hub" "$HOME/bin/hub"
fi
execute "chmod +x '$HOME/bin/hub'" \
        "hub"


install_binary "icdiff" \
    "https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.9.4/icdiff"

install_binary "prettyping" \
    "https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping"


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
