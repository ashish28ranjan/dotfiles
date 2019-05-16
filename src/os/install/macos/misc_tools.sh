#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"


tmpDir="$(mktemp -d /tmp/XXXXX)"


brew_install "aria2" "aria2"

install_binary "assh" \
    "https://github.com/moul/assh/releases/download/v2.8.0/assh_darwin_amd64"

brew_install "bat" "bat"

install_binary "diff-so-fancy" \
    "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"


if [ ! -f "$HOME/bin/exa" ]; then
    wget -qO "$tmpDir/exa.zip" "https://github.com/ogham/exa/releases/download/v0.8.0/exa-macos-x86_64-0.8.0.zip" &> /dev/null \
        && unzip -qq -o -d "$tmpDir" "$tmpDir/exa.zip" \
        && cp -f "$tmpDir/exa-macos-x86_64" "$HOME/bin/exa"
fi
execute "chmod +x '$HOME/bin/exa'" \
        "exa"


brew_install "fd" "fd"

brew_install "glances" "glances"

brew_install "htop" "htop"

install_binary "icdiff" \
    "https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.9.4/icdiff"

brew_install "iTerm2" "iterm2" "caskroom/cask" "cask"

install_binary "prettyping" \
    "https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping"

brew_install "Python3" "python3"

execute "sudo -H pip3 install --upgrade pip" \
        "Pip3 upgrade"

execute "pip3 install --user pipenv" \
        "Pipenv"

brew_install "ripgrep (rg)" "ripgrep"
brew_install "ShellCheck" "shellcheck"
brew_install "The Silver Searcher (ag)" "the_silver_searcher"
brew_install "tree" "tree"


if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn" "" "" "--without-node"
fi
