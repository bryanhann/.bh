exit () {
    echo 'exit #' $BORGDEPTH
    if [[ ${BORGDEPTH} == "0" ]]; then
        echo 'cannot exit shell depth 0. Try builtin exit'
    else
        builtin exit
    fi
}
.export BORGDEPTH $(( $BORGDEPTH + 1 ))

