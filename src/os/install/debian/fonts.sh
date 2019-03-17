#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"


localFontPath="$HOME/.local/share/fonts"
downloadPath="$(mktemp -d)"

mkdir -p "$localFontPath"

if [ ! -f "$localFontPath/iosevka-term-regular.ttf" ]; then

    execute "wget -qO $downloadPath/02-iosevka-term-2.2.0.zip \
                'https://github.com/be5invis/Iosevka/releases/download/v2.2.0/02-iosevka-term-2.2.0.zip' &> /dev/null \
            && unzip -qq -o -d $downloadPath \
                $downloadPath/02-iosevka-term-2.2.0.zip \
            && cp -f $downloadPath/ttf/*.ttf \
                $localFontPath" \
        "Iosevka"

else
    print_success "Iosevka"
fi


if [ ! -f "$localFontPath/UbuntuMono-R.ttf" ]; then

    execute "wget -qO $downloadPath/ubuntu-font-family-0.83.zip \
                'https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip' &> /dev/null \
            && unzip -qq -o -d $downloadPath \
                $downloadPath/ubuntu-font-family-0.83.zip \
            && cp -f $downloadPath/ubuntu-font-family-0.83/*.ttf \
                $localFontPath" \
        "Ubuntu"

else
    print_success "Ubuntu"
fi


execute "chmod 644 $localFontPath/*.ttf \
        && fc-cache -f $localFontPath" \
    "Update font cache"
