typeset -ga isanai_settings_tasks
typeset -ga isanai_key_tasks
typeset -ga isanai_alias_tasks

isanai_add_settings_task () {
    isanai_settings_tasks+="$1"
}

isanai_add_key_task () {
    isanai_key_tasks+="$1"
}

isanai_add_alias_task () {
    isanai_alias_tasks+="$1"
}

isanai_execute_all () {
    for task in $isanai_settings_tasks; do
        $task
    done

    for task in $isanai_key_tasks; do
        $task
    done

    for task in $isanai_alias_tasks; do
        $task
    done
}
