[[ -z ${BORG} ]] && {
    .export BORG       $ZDOTDIR
    .export BORGBUILD  ~/.build

    .export BORGTEMP   $BORGBUILD/BORGTMP
    .export BORGBIN    $BORGBUILD/BORGBIN
    .export BORGVENV   $BORGBUILD/BORGVENV

    .export BORGDEPTH -1
    .export BORGPID0  $$

    mkdir -p $BORGTEMP
    mkdir -p $BORGBIN

    .export PATH       $PATH:$BORGBIN
    .export ZSH        $BORGBUILD/ZSH
    .export PYTHONPATH $BORG/lib/python
}
