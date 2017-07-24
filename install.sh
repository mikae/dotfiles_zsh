#!/usr/bin/env bash

# Find script parent dir path.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done

CONFIG_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

TMP_SOURCE=/tmp/zsh_install

CLEAN=false
INSTALL=false
INSTALL_PLUGINS=false

SOURCE_FZF=https://github.com/junegunn/fzf

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        --clean)
            CLEAN=true
            ;;
        --install)
            INSTALL=true
            ;;
        --install-plugins)
            INSTALL_PLUGINS=true
            ;;
        --all)
            CLEAN=true
            INSTALL=true
            INSTALL_PLUGINS=true
            ;;
    esac

    shift
done

# setup config dir
[ -d $TMP_SOURCE ] || rm -rfv $TMP_SOURCE
mkdir -pv $TMP_SOURCE
cd $TMP_SOURCE

# wipe old config
if $CLEAN; then
    rm -v ~/.zshrc
    rm -rfv ~/.zsh
fi

[ ! -d ~/.zsh ] && mkdir ~/.zsh

if $INSTALL_PLUGINS; then
    [ ! -d ~/.zsh/.zplug ] && git clone https://github.com/zplug/zplug ~/.zsh/.zplug
fi

if $INSTALL; then
    cp -v  $CONFIG_DIR/src/.zshrc ~
    cp -Rv $CONFIG_DIR/src/.zsh ~
fi
