isanai_settings_export_path_variables () {
    export ISANAI_CABAL_PATH=$HOME/.cabal
    export ISANAI_NVM_PATH=$HOME/.nvm/nvm.sh
    export ISANAI_YARN_PATH=$HOME/.yarn
    export ISANAI_NEOFETCH_CONFIG_PATH=$HOME/.config/neofetch/config
    export ISANAI_VENVWRAPPER_PATH=$HOME/.local/bin/virtualenvwrapper.sh
    export ISANAI_LOCAL_BIN_PATH=$HOME/.local/bin
    export ISANAI_YARN_BIN_PATH=$HOME/.yarn/bin
    export ISANAI_YARN_GLOBAL_BIN_PATH=$HOME/.yarn/global/node_modules/.bin
}

isanai_settings_default () {
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

isanai_settings_configure_PATH () {
    PATH="$ISANAI_LOCAL_BIN_PATH:$PATH"
    PATH="$ISANAI_CABAL_PATH/bin:$PATH"
    PATH="$ISANAI_CABAL_PATH/bin:$PATH"
    PATH="$ISANAI_YARN_BIN_PATH:$PATH"
    PATH="$ISANAI_YARN_GLOBAL_BIN_PATH:$PATH"
}

isanai_add_settings_task isanai_settings_export_path_variables
isanai_add_settings_task isanai_settings_configure_PATH
isanai_add_settings_task isanai_settings_default
