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

# zsh-users/zsh-autosuggestions;
if zplug check zsh-users/zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down) # Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}") # Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets

  bindkey '^ ' autosuggest-accept
fi
