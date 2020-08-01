[[ -z ${BORGHOME} ]] && {
    .export BORGHOME   $ZDOTDIR
    .export PYTHONPATH $BORGHOME/lib/python

    .export BORGBUILD  ~/.build
    .export BORGTEMP   $BORGBUILD/BORGTMP
    .export ZSH        $BORGBUILD/ZSH
    .export BORGBIN    $BORGBUILD/BORGBIN
    .export BORGVENV   $BORGBUILD/BORGVENV

    .export PATH       $PATH:$BORGBIN
    .export BORGDEPTH -1
    .export BORGPID0  $$

    mkdir -p $BORGTEMP
    mkdir -p $BORGBIN
}
