pushd $ZDOTDIR
source $ZDOTDIR/functions.sh
function bh0firstrun { [[ -z "$BHPID" ]] && return 0 || return 1 }
for script in $( ls [0-9]*.sh | sort ); do bh0source ${ZDOTDIR}/$script; done
popd
bh0firstrun && export BHPID=$$
