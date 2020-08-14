export BH0NEST=0
_up      () {  export BH0NEST=$((${BH0NEST}+1)); }
_down    () {  export BH0NEST=$((${BH0NEST}-1)); }
_tab     () { [[ "${BH0NEST}" == "0" ]] || for i in $( seq ${BH0NEST} ); do printf '|\\t'; done ; }
_color   () { tput setaf $1; [[ "$2" == "." ]] || tput setab $2; shift; shift; echo -n $*; tput sgr0; }
_black   () { _color 15  0 $(_tab)$*; echo; }
_blue    () { _color 15  4 $(_tab)$*; echo; }
_yellow  () { _color 16 11 $(_tab)$*; echo; }
_green   () { _color  0 10 $(_tab)$*; echo; }
_red     () { _color 15  9 $(_tab)$*; echo; }

bh0note ()      { _green "# $*" }
bh0exec ()      { _red exec: $*; $*; }
bh0export ()    { _blue "setting \$$1 := [$2]" ; export $1=$2 }
bh0call ()      { _yellow "++[$*]" ; _up ; $* ; _down ; _yellow "--[$*]"; }
bh0source ()    { bh0call source $*; }

bh0include () { 
    bh0source $(bh0github bryanhann/$1)/activate.sh; 
}

bh0github () {
    src=https://github.com/$1
    dst=${2-${HOME}/.bh/http/github.com/$1}
    [[ -d ${dst} ]] || git clone $src $dst
    echo $dst
}

#   function:   [bh0firstrun]
#   flag:       [$__BHPID__]
#
#   This function returns exit code [0] during the entire first execution of [.zshrc]
#   after which it returns the exit code [1].  Whether this is a first run is deterined
#   by testing the flag [$__BHPID__] which will be set only at the final act of [.zshrc]
#
#   (The flag will be set to the current process ID.)

bh0firstrun () {
    [[ -z "${__BHPID__}" ]] && return 0 || return 1;
}

#   folder:     [$BH0__RAW__]
#
#   The RAW folder [$BH0__RAW__] is where included services will store raw data to be
#   processed by (and eventually removed by) these services. It SHOULD NOT be archived.
#   It SHOULD NOT be subject to version control. It MUST NOT be removed.

bh0export BH0__RAW__        ~/.bh/RAW
mkdir -p ${BH0__RAW__}

#   folder:     [$BH0__LOCAL__]
#
#   The LOCAL folder [$BH0__LOCAL__] is where included services will store code or data
#   which, though recreatable, would take a long time to recreate. It MAY be removed but
#   it SHOULD NOT be removed except for testing purposes or for wholesale restoration if
#   corrupted. 

bh0export BH0__LOCAL__      ~/.bh/LOCAL
mkdir -p ${BH0__LOCAL__}

#   folder:     [$BH0__PERSIST__]
#   include:    [bh0.__persist__]
#
#   The PERSIST folder [$BH0__PERSIST__] is where conguration info is maintained and
#   updated (e.g. HISTFILE files) but which should be preserved for replication in case
#   of corruption, or for deployment on other machines. It MUST NOT be removed except
#   for restoration. It MUST be archivable under version control. It SHOULD be committed
#   and pushed to a backup repository regularly.
#
#   Management of this folder (including it's original creation) is the responsibility
#   of the included [bh0.__persist__] which should be changed only for administration
#   purposes.

bh0export BH0__PERSIST__    ~/.bh/PERSIST
[[ -d ${BH0__PERSIST__} ]] || git clone https://github.com/bryanhann/.__PERSIST__ ${BH0__PERSIST__}
bh0include bh0.__persist__

#   include:    [bh0.__user__] is where conguration info is maintained and
#
#   This directs all user inclusions, and may be changed by the user for personal
#   purposes.

bh0include bh0.__user__


#   SET THE FLAG [$__BHPID__] to [$$] AT THE END OF THE FIRST RUN

bh0firstrun && {
    bh0export   __BHPID__ $$
}
