pushd $ZDOTDIR
source $ZDOTDIR/functions.sh
function .firstrun { [[ -z "$BHPID" ]] && return 0 || return 1 }
for script in $( ls [0-9]*.sh | sort ); do .source ${ZDOTDIR}/$script; done
popd
.firstrun && export BHPID=$$
