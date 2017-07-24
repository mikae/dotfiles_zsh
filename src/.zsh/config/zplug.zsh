# zplug environment variables
ZPLUG_HOME=$DIR_ZSH/.zplug
ZPLUG_CACHE_DIR=$ZPLUG_HOME/.cache
ZPLUG_BIN=$ZPLUG_HOME/bin
ZPLUG_LOADFILE=$ZPLUG_HOME/packages.zsh

ZPLUG_THREADS=16
ZPLUG_PROTOCOL=HTTPS
ZPLUG_USE_CACHE=true

# Load zplug
source $ZPLUG_HOME/init.zsh

# Load plugin list
source $DIR_CONFIG/plugin_list.zsh

# Install plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load plugins
zplug load

# Configure plugins
source $DIR_CONFIG/plugin_config.zsh