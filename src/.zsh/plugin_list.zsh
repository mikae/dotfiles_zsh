# b4b4r07/enhancd
zplug 'b4b4r07/enhancd', use:init.sh

# djui/alias-tips
zplug 'djui/alias-tips'

# junegunn/fzf
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*${(L)$(uname -s)}*amd64*"
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# Valiev/almostontop
zplug 'Valiev/almostontop'

# zsh-users/zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2, on:"zsh-users/zsh-syntax-highlighting"

# TODOs:
# mollifier/anyframe
