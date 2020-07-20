_r20_export R20_DEPTH $(( ${R20_DEPTH} + 1 ))
function exit() { [[ "${R20_DEPTH}" == "0" ]] && echo try 'builtin exit' || builtin exit }
function depth() { echo ${R20_DEPTH} }
