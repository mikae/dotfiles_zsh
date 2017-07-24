# b4b4r07/enhancd
if zplug check b4b4r07/enhancd; then
    # enhancd dir
    export ENHANCD_DIR=$DIR_CONFIG/.enhancd
    [ ! -d $ENHANCD_DIR ] && mkdir $ENHANCD_DIR

    # Use only home
    export ENHANCD_DISABLE_DOT=1
    export ENHANCD_DISABLE_HYPHEN=1
    export ENHANCD_DISABLE_HOME=0

    # ls after cd
    export ENHANCD_HOOK_AFTER_CD="ls -la"
fi

# djui/alias-tips
if zplug check djui/alias-tips; then
    # Alias tooltip message
    export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Use this: "

    # Force alias usage
    export ZSH_PLUGINS_ALIAS_TIPS_FORCE=1
fi

# zsh-users/zsh-history-substring-search
if zplug check zsh-users/zsh-history-substring-search then
   bindkey '^[[A' history-substring-search-up
   bindkey '^[[B' history-substring-search-down
   bindkey -v vicmd 'j' history-substring-search-up
   bindkey -v vicmd 'j' history-substring-search-down
fi
