#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

nix_install "aria2" "nixpkgs.aria"
nix_install "bat" "nixpkgs.bat"
nix_install "curl" "nixpkgs.curlFull"
nix_install "diff-so-fancy" "nixpkgs.gitAndTools.diff-so-fancy"
nix_install "exa" "nixpkgs.exa"
nix_install "fd" "nixpkgs.fd"
nix_install "ffmpeg" "nixpkgs.ffmpeg_4"
nix_install "Glances" "nixpkgs.python37Packages.glances"
nix_install "Icdiff" "nixpkgs.icdiff"
nix_install "Neovim" "nixpkgs.neovim"
nix_install "Prettyping" "nixpkgs.prettyping"
nix_install "Ripgrep (rg)" "nixpkgs.ripgrep"
nix_install "Silver Searcher (ag)" "nixpkgs.silver-searcher"
nix_install "Tmux" "nixpkgs.tmux"
nix_install "Tree" "nixpkgs.tree"
nix_install "Vim 8" "nixpkgs.vim"
nix_install "Xclip" "nixpkgs.xclip"
nix_install "Yarn" "nixpkgs.yarn"
nix_install "Ydiff" "nixpkgs.ydiff"
