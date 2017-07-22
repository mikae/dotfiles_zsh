if zplug check b4b4r07/enhancd; then
    export ENHANCD_DIR=$DIR_CONFIG/.enhancd
    export ENHANCD_DISABLE_DOT=1
    export ENHANCD_DISABLE_HYPHEN=1
    export ENHANCD_DISABLE_HOME=1
    export ENHANCD_HOOK_AFTER_CD="ls"
fi
