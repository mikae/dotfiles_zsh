isanai_export_path_variables () {
    ISANAI_NVM_PATH=$HOME/.nvm/nvm.sh
    ISANAI_VENVWRAPPER_PATH=$HOME/.local/bin/virtualenvwrapper.sh

    export ISANAI_NVM_PATH
    export ISANAI_VENVWRAPPER_PATH
}

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

isanai_configure_PATH () {
    PATH="$PATH_CABAL/bin:$PATH"
}

isanai_add_settings_task isanai_export_path_variables
isanai_add_settings_task isanai_configure_PATH
isanai_add_settings_task isanai_default_settings
