export MYDEPTH=$(( ${MYDEPTH:--1} + 1 ))

exit () {
    echo 'exit #' ${MYDEPTH}
    if [[ ${MYDEPTH} == "0" ]]; then
        echo 'cannot exit shell depth 0. Try builtin exit'
    else
        builtin exit
    fi
}

