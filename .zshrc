#source ${ZDOTDIR}/zshrc.sh
.devnul () { $* 2> ${BORGDEVNUL}; }
.export () { export $1=$2; echo "$1 <-- $2" >> $ZDOTDIR/.log; }
echo >> $ZDOTDIR/.log
date >> $ZDOTDIR/.log
echo >> $ZDOTDIR/.log
for script in $(  ls -1 $ZDOTDIR/[0-9]*.sh | sort ) ; do
    echo ">>>>>>>>>>>> $script <<<<<<<<<<<<" >> $ZDOTDIR/.log
    source $script
done
