[[ -z ${BORGHOME} ]] && {
    .export BORGHOME  $ZDOTDIR
    .export BORGDEPTH -1
    .export BORGPID0  $$
    .export BORGBUILD $BORGHOME/.build
    .export BORGTEMP  $BORGHOME/.tmp
    .export BORGVENV  $BORGBUILD/venv
    .export ZSH       $BORGBUILD/omzsh
    .export PATH      $PATH:$BORGHOME/bin
    .export PYTHONPATH ${PYTHONPATH}:${BORGHOME}/lib/python
    mkdir -p $BORGTEMP
}
