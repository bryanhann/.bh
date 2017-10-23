LOG=

[ "$LOG" == "" ] && export LOG=$1
[ "$LOG" == "" ] && export LOG=$ZLOG
[ "$LOG" == "" ] && export LOG=$HOME/__DEFAULT.ZLOG 

touch $LOG
[ ! -f "$LOG" ] && echo ZLOG: File $LOG is not regular && exit
[ ! -w "$LOG" ] && echo ZLOG: File $LOG is not writeable && exit

tail $LOG
echo -------------------------------------
echo -n \>

read LINE

[ "$LINE" == "" ] || echo `date "+%Y-%m-%d-T-%H:%M:%S"` "$LINE" >> $LOG

tail $LOG
echo -------------------------------------
echo log written at $LOG

