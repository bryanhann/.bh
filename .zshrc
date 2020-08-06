function .firstrun { [[ -z "$BHPID" ]] && return 0 || return 1 }
source $ZDOTDIR/functions.sh
source $ZDOTDIR/activate.sh
.firstrun && export BHPID=$$
