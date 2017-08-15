source $ISANAI_HOME/task.zsh

source $ISANAI_HOME/settings.zsh
source $ISANAI_HOME/zplug.zsh
source $ISANAI_HOME/key.zsh
source $ISANAI_HOME/aliases.zsh

for plugin_config in $ISANAI_HOME/plugin/*.zsh; do
    source $plugin_config
done

isanai_execute_all
