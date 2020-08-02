cd $ZDOTDIR
source $ZDOTDIR/functions
_log "\n$(date)\n"
_yellow "++[$ZDOTDIR/.zshrc]"
_up
    .exec()   { _red exec: $*; $*; } ; _note defining function .exec
    .note()   { _note $*;     } ; _note defining function .note 
    .export() { _export $*;   } ; _note defining function .export
    .source() { _source $*;   } ; _note defining function .source
    [[ -z "$BORG" ]] && {  for script in $(ls [0]*.sh   | sort) ; do _source $script; done }
    [[ true       ]] && {  for script in $(ls [1-9]*.sh | sort) ; do _source $script; done }
_down
_yellow "--[$ZDOTDIR/.zshrc]"
