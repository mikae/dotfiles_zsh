typeset -ga isanai_tasks_alias
typeset -ga isanai_tasks_key
typeset -ga isanai_tasks_settings

isanai_add_alias_task () {
    isanai_tasks_alias+=$1
}

isanai_add_key_task () {
    isanai_tasks_key+=$1
}

isanai_add_settings_task () {
    isanai_tasks_settings+=$1
}

isanai_execute () {
    for task in $1; do
        $task
    done
}

isanai_execute_all () {
    execute $isanai_tasks_settings
    execute $isanai_tasks_key
    execute $isanai_tasks_settings
}
