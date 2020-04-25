export SCOPE=()
_block  () { tput setaf $1; [[ "$2" == "." ]] || tput setab $2; shift; shift; echo -n $*; tput sgr0; }
_colors () { for f in $(seq 0 16); do for b in $(seq 0 16); do _block $f $b "$f/$b "; done; echo; done }
_black  () { _block 15 0 $* ; }
_red    () { _block 15 9 $* ; }
_green  () { _block 10 0 $* ; }
_green  () { _block 0 10 $* ; }
_yellow () { _block 16 11 $* ; }
_blue   () { _block 15 4 $* ; }
_red    () { _block 15 9 $* ; }
_grey   () { _block 16 7 $* ; }
_green_on_white () { _block 6 . $*; }
_red_on_white   () { _block 13 . $*; }
_black_on_grey  () { _block 16 15 $*; }

r20note   () { tput smso; echo $SCOPE $*; tput rmso; }
r20exit   () { unset 'SCOPE[${#SCOPE[@]}]'; }
r20enter  () { SCOPE+="[$1]"; }
r20map    () { fn=$1;shift;for item in $*; do $fn $item; done; }
r20export () { r20prefix; _yellow " $1 := $2 "; echo; export $1=$2; }
r20env    () { r20map r20try $(set|grep "^R20"); }
r20cmd    () { _black ${SCOPE}; _yellow " $ $*"; echo; $* }
r20all    () { r20note "    $ set|grep ^R20"; set|grep "^R20"; }
r20prefix () { _black ${SCOPE}; _blue "$PACKAGE"; }

#_colors

r20pip_install () {
    pip list | grep "^$1 " > /dev/null &&  {
        r20prefix; _yellow " confirmed: (pip)" $(pip list | grep "^$1 "); echo;
        return
    }
    r20prefix;  _yellow " installing: (pip) $1 "; echo;
    pip install $1;
    r20prefix; _yellow " confirmed: (pip)" $(pip list | grep "^$1 "); echo;

}

r20install () {
    export PACKAGE="[$1]"
    src=${R20_INIT_URL}/r20.activate.${1}.git
    dst=${R20_INIT_BLD}/${1}
    precfg=${R20_INIT_CFG}/${1}/activate.sh
    postcfg=${R20_INIT_BLD}/${1}/activate.sh
    [[ "$2" == "-r" ]] && { rm -rf ${R20_INIT_BLD}/${1}; }
    [ -d $dst ] && { r20prefix; _grey  " $ git clone $src $dst"; echo; }
    [ -d $dst ] || { r20prefix;  _green " $ git clone $src $dst"; echo; git clone $src $dst }
    [ -f $precfg ] && { r20prefix; _green " $ source $precfg"; echo; source $precfg }
    [ -f $precfg ] || { r20prefix; _red   " $ source $precfg"; echo; }
    [ -f $postcfg ] && { r20prefix; _green " $ source $postcfg"; echo; source $postcfg }
    [ -f $postcfg ] || { r20prefix; _red   " $ source $postcfg"; echo; }
    export PACKAGE=$0
}

