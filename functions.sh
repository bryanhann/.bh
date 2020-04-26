_block      () { tput setaf $1; [[ "$2" == "." ]] || tput setab $2; shift; shift; echo -n $*; tput sgr0; }
_colors     () { for f in $(seq 0 16); do for b in $(seq 0 16); do _block $f $b "$f/$b "; done; echo; done }
_black      () { _block  15   0  $*; }
_blue       () { _block  15   4  $*; }
_yellow     () { _block  16  11  $*; }
_green      () { _block   0  10  $*; }
_red        () { _block  15   9  $*; }

_skip       () { _block  10  15  " $* "; }
_doit       () { _block  16  15  " $* "; }

_note       () { _r20_prefix;               _yellow " $* "     ; echo; }
_star       () { _r20_prefix; _green " * "; _yellow "     $* " ; echo; }

_r20_pip_check      () { pip list | grep "^$1 " > /dev/null; return $?; }
_r20_pip_lookup     () { _r20_pip_check $1 && echo $(pip list | grep "^$1 ") || echo ""; }
_r20_pip_confirm    () { _star confirmed: pip: $(_r20_pip_lookup $1); }
_r20_pip_install    () { _star installing: pip: $1 ; pip install $1; }

_r20_try_source     () { [ -f $1 ]   && _r20_cmd_yes source $1    || _r20_cmd_bad source $1; }
_r20_try_clone      () { [ ! -d $2 ] && _r20_cmd_yes git clone $* || _r20_cmd_non clone $* }

_r20_show           () { _note "[$1] == [$(eval echo \$$1)]"; }
_r20_prefix         () { _black ${SCOPE}; _blue ${PACKAGE}; }

_r20_cmd_yes        () { _r20_prefix ; _green " $ " ; _doit $* ; echo; $* }
_r20_cmd_non        () { _r20_prefix ; _green " X " ; _skip $* ; echo; }
_r20_cmd_bad        () { _r20_prefix ; _red   " X " ; _skip $* ; echo; }

_r20_export         () { _note "$1 <-- $2"; export $1=$2; }
_r20_enter          () { SCOPE="[$1]"; }
_r20_exit           () { unset SCOPE; }

#-----------------------------------------------------------------------------#
# API r20pip_install
#-----------------------------------------------------------------------------#

r20pip_install  () {
    _r20_pip_check $1 || _r20_pip_install $1
    _r20_pip_confirm $1;
}

#-----------------------------------------------------------------------------#
# API r20export
#-----------------------------------------------------------------------------#

r20export   () { _star "$1 <== $2"; export $1=$2; }

#-----------------------------------------------------------------------------#
# API r20install
#-----------------------------------------------------------------------------#

r20install () {
    export PACKAGE="[$1]"
    echo
    [[ "$2" == "-r" ]] && { rm -rf ${R20_INIT_BLD}/${1}; }
    _r20_try_clone ${R20_INIT_URL}/r20.activate.${1}.git ${R20_INIT_BLD}/${1}
    _r20_try_source ${R20_INIT_CFG}/${1}/activate.sh
    _r20_try_source ${R20_INIT_BLD}/${1}/activate.sh
    unset PACKAGE
}
