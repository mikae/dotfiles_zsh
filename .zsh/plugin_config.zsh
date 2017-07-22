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
    export ENHANCD_HOOK_AFTER_CD="ls"
fi
