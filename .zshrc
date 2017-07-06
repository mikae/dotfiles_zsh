# Environment variables {{{1

export ANDROID_HOME=/home/data/Local/Programs/AndroidSDK
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export CONFIG_DIR=$HOME/.zsh
export PLUGIN_DIR=$HOME/.zsh/plugins
export OH_MY_ZSH_HOME=/home/yui/.oh-my-zsh
export ZSH=$OH_MY_ZSH_HOME

export LANG=en_US.UTF-8

export PAGER=/usr/local/bin/vimpager

PATH="/home/yui/.cask/bin:$PATH"
PATH="/usr/sbin:$PATH"
PATH="/usr/lib/lua/luarocks/bin:$PATH"
PATH="/home/yui/.nodejs/bin:$PATH"
export PATH

export MPD_HOST=127.0.0.1
export MPD_PORT=7701

# Workon home
export WORKON_HOME=/home/data/Data/Documents/Python/.virtualenvs
export VIRTUALNENVWRAPPER_SOURCE=/usr/bin/virtualenvwrapper.sh

# editor
export EDITOR='vim'

# lfs
export LFS=/mnt/lfs

export COWPATH=~/.cow

# NVM
export NVM_DIR=$HOME/.nvm
# }}}

# Functions {{{
#
# Move between zsh and vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

# }}}

# Aliases {{{1
# no vi
alias vi="vim"
# no nvim
alias nvim="vim"

# virtual env
alias mkv2="mkvirtualenv -p /usr/bin/python2"
alias mkv3="mkvirtualenv -p /usr/bin/python3"
alias rmv="rmvirtualenv"
alias wo="workon"
alias de="deactivate"

# ncmpc
alias ncmpc="ncmpc --port 7701"

# fast clear
alias cl="clear"

# }}}

# Configuration {{{1

VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# prevent duplicate lines
setopt HIST_IGNORE_DUPS

# don't kill jobs, when exit zsh
setopt NO_HUP

ZSH_THEME="dallas"
plugins=(git vi-mode zsh-completions zsh-autosuggestions)
# }}}

# Plugins {{{1

# Enhancd {{{2

[ -s $PLUGIN_DIR/enhancd/init.sh ] && source $PLUGIN_DIR/enhancd/init.sh

# }}}

# }}}

# Post configuration {{{
[ -s $VIRTUANENVWRAPPER_SOURCE ] && source $VIRTUALNENVWRAPPER_SOURCE

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -s $OH_MY_ZSH_HOME/oh-my-zsh.sh ] && source $OH_MY_ZSH_HOME/oh-my-zsh.sh
# }}}

# Bindings {{{1

# autosuggestions settings
bindkey '^ ' autosuggest-accept

# vi-mode settings
bindkey -M viins ',j' vi-cmd-mode

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
bindkey -v '^Z' fancy-ctrl-z

# }}}

if hash neofetch && [ -n "$DISPLAY" ]; then
    neofetch --image ~/.config/neofetch/image.png
fi
