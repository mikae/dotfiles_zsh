isanai_default_settings () {
    # History
    HISTFILE=$ISANAI_TMP/.zsh_history
    HISTSIZE=10000000
    SAVEHIST=10000000
    setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
    setopt SHARE_HISTORY             # Share history between all sessions.
    setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
    setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

    # Variables
    EDITOR=nvim
}

isanai_configure_path () {
    PATH="$PATH_CABAL/bin:$PATH"
}

isanai_add_settings_task isanai_configure_path
isanai_add_settings_task isanai_default_settings
