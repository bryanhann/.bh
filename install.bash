
##################################################################
# Confirm that this script was called from within its own 
# directory (not called from any other directory, and not
# sourced. This directory should NOT be on $PATH. 
##################################################################

if [ ! "$0" == "./install.bash" ]; then
       echo try \'./install.bash\' 
       exit
fi

# UPDATE THESE IF CHANGES ARE MADE TO THE FILESTRUCSTURE
export ROOT=root
export BANG=!
export MUSE=muse
export LIST=$ROOT/targets

# THESE ARE WHAT WE MUST WORK WITH
export ROOT=$PWD/$ROOT
export BANG=$HOME/$BANG
export MUSE=$BANG #/$MUSE
export LIST=$MUSE/$LIST


# WE RENEW THE LINK
rm -f $BANG
ln -s $PWD $BANG


# WE CAN NOW READ THE LIST OF FILES TO BE OVERWRITTEN
for FILE in `cat $LIST` ; do 
    [ -e "$HOME/$FILE" ] \
            && [ "$1" == "--force" ] \
            && rm $HOME/$FILE
    [ -e "$HOME/$FILE" ] \
	    && echo SKIPPING: $HOME/$FILE \
	    && continue
    echo touching: $HOME/$FILE 
    echo export BANG=$BANG      >> $HOME/$FILE
    echo export MUSE=$MUSE      >> $HOME/$FILE
    echo source $BANG/root/$FILE     >> $HOME/$FILE  
done

