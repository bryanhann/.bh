r20note   () { echo "---> [$NAME] --->" $*; }
r20header () { echo ">>>> [$NAME] >>>> [$*]"; }
r20exit   () { r20header "--exit--"; export NAME=none; }
r20enter  () { export NAME=$1; r20header "--enter--" }
r20map    () { fn=$1;shift;for item in $*; do $fn $item; done; }
r20export () { r20note "    $1 := $2"; export $1=$2; }
r20env    () { r20map r20try $(set|grep "^R20"); }
r20clone  () { [ -d $2 ] || git clone $1 $2; }
r20source () { [ -f $1 ] && {r20note "    sourcing: $1";source $1;}||{r20note "    skipping: $1";};}
r20all    () { r20note "    $ set|grep ^R20"; set|grep "^R20"; }

__r20pip_install () {
    r20note "    pip: installing $1"
    pip list | grep "^$1 " && return 0
    echo
    pip install $1
    echo
}


r20try () {
    (( ${+OLDMAGIC} )) || OLDMAGIC=()
    for X in "${OLDMAGIC[@]}"; do {[ "$1" = "$X" ] && return}; done
    OLDMAGIC+=$1
    r20note "EXPORT:" $1
}

r20install () {
    r20header $1
    [[ "$2" == "-r" ]] && { rm -rf ${R20_INIT_BLD}/${1}; }
    r20clone  ${R20_INIT_URL}/r20.activate.${1}.git ${R20_INIT_BLD}/${1}
    r20source ${R20_INIT_CFG}/${1}/activate.sh
    r20source ${R20_INIT_BLD}/${1}/activate.sh
}

