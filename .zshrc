source $ZDOTDIR/functions.sh
#function bh0firstrun { [[ -z "$BHPID" ]] && return 0 || return 1 }


pushd $ZDOTDIR
for script in $( ls [0-9]*.sh | sort ); do bh0source ${ZDOTDIR}/$script; done
popd

#ibh0export BH0BASE $(dirname $ZDOTDIR )
#bh0include () {
#    url=https://github.com/bryanhann/$1
#    dst=${BH0BASE}/$1
#    [[ -d $dst ]] && bh0note found external: ${1}
#    [[ -d $dst ]] || bh0note fetching external: ${1}
#    [[ -d $dst ]] || bh0exec git clone $url $dst
#    [[ -d $dst ]] || { bh0note cannot fetch external ${1} -- giving up; return  }
#    bh0source $dst/activate.sh
#}

bh0firstrun && export BHPID=$$
