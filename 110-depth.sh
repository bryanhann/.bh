bh0firstrun && bh0export depth_current -1
bh0export depth_current $(( $depth_current + 1 ))
function depth {} { echo $depth_current }
function exit {
    echo leaving depth \#$(depth)
    [[ "$depth_current" == "0" ]] || builtin exit
    echo try 'builtin exit'
}
