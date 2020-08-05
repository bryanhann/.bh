export NEST=0
_up      () {  export NEST=$((${NEST}+1)); }
_down    () {  export NEST=$((${NEST}-1)); }
_tab     () { [[ "${NEST}" == "0" ]] || for i in $( seq ${NEST} ); do printf '\\t'; done ; }
_color   () { tput setaf $1; [[ "$2" == "." ]] || tput setab $2; shift; shift; echo -n $*; tput sgr0; }
_black   () { _color 15  0 $(_tab)$*; echo; }
_blue    () { _color 15  4 $(_tab)$*; echo; }
_yellow  () { _color 16 11 $(_tab)$*; echo; }
_green   () { _color  0 10 $(_tab)$*; echo; }
_red     () { _color 15  9 $(_tab)$*; echo; }
.note () { _green "# $*" }
.exec () { _red exec: $*; $*; }
.export () { _blue "setting \$$1 := [$2]" ; export $1=$2 }
.source () { _yellow "++[. $*]" ; _up ; source $* ; _down ; _yellow "--[. $*]"; }
.call () { _yellow "++[$*]" ; _up ; $* ; _down ; _yellow "--[$*]"; }

