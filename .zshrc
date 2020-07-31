#source ${ZDOTDIR}/zshrc.sh

.source () {
    echo '>>>>>>' .source $1
    source $1
}
.devnul () { $* 2> ${BORGDEVNUL}; }
.export () { export $1=$2; echo "$1 <-- $2" >> $ZDOTDIR/.log; }
echo >> $ZDOTDIR/.log
date >> $ZDOTDIR/.log
echo >> $ZDOTDIR/.log
cd $ZDOTDIR
[[ -z "$BORG" ]] && {
    export BORG=$ZDOTDIR
    for script in $(  ls [0]*.sh | sort ) ; do
        .source $script
    done
}

for script in $(  ls [1-9]*.sh | sort ) ; do
    #echo ">>>>>>>>>>>> $script <<<<<<<<<<<<" >> $ZDOTDIR/.log
    .source $script
done
#cat $BORG/.log
