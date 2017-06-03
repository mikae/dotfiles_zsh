#!/usr/bin/env bash

# Find script parent dir path.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done

CONFIG_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
CONFIG_ZSHRC=$CONFIG_DIR/.zshrc

TMP_SOURCE=/tmp/zsh_install

install_oh_my_zsh() {
    [ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
}

install_fzy() {
    if hash fzy 2>/dev/null; then
        return
    else
        git clone https://github.com/jhawthorn/fzy
        cd fzy
        make
        sudo make install
        cd ..
    fi
}

CLEAN=false
INSTALL=false
INSTALL_PLUGINS=false

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
    [ -d ~/.oh-my-zsh ] && rm -rfv ~/.oh-my-zsh
    [ -d ~/.zsh ] && rm -rfv ~/.zsh
    [ -f ~/.zshrc ] && rm -v ~/.zshrc
fi

if $INSTALL_PLUGINS; then
    # install fuzzy searcher
    install_fzy

    # install oh my zsh
    install_oh_my_zsh

    # oh-my-zsh plugins
    [ -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
    [ -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ] || git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

    # custom plugins
    [ -d ~/.zsh/plugins ] || mkdir -p ~/.zsh/plugins
    [ -d ~/.zsh/plugins/enhancd ] || git clone https://github.com/b4b4r07/enhancd.git ~/.zsh/plugins/enhancd
fi

if $INSTALL; then
    # install .zshrc
    cp $CONFIG_ZSHRC ~
fi
