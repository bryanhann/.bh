source ${ZDOTDIR}/functions.sh

bh0include () {
    url=https://github.com/bryanhann/$1
    dst=~/$1
    [[ -d $dst ]] && bh0note found external: ${1}
    [[ -d $dst ]] || bh0note fetching external: ${1}
    [[ -d $dst ]] || bh0exec git clone $url $dst
    [[ -d $dst ]] || { bh0note cannot fetch external ${1} -- giving up; return ; }
    [[ -f $dst/activate.sh ]] && bh0source $dst/activate.sh ;
}

bh0firstrun () {
    [[ -z "${__BHPID__}" ]] && return 0 || return 1;
}

bh0export    __LOCAL__       ~/.__LOCAL__
bh0include bh0.master
bh0firstrun && bh0export    __BHPID__       $$

