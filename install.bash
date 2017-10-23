##################################################################
# Confirm that this script was called from within its own 
# directory (not called from any other directory, and not
# sourced. This directory should NOT be on $PATH. 
##################################################################
[ "$0" == "./install.bash" ] || echo try \'./install.bash\' 
[ "$0" == "./install.bash" ] || exit

# UPDATE THESE IF CHANGES ARE MADE TO THE FILESTRUCSTURE
export MUSE=$HOME/!
export ROOT=$MUSE/root

# REFRESH THE SYMLINK
rm -f $MUSE
ln -s $PWD $MUSE

# REWRITE THE $HOME/.* FILES
for FILE in `ls $ROOT` ; do 
    [ -e "$HOME/.$FILE" ] \
            && [ "$1" == "--force" ] \
            && rm $HOME/.$FILE
    [ -e "$HOME/.$FILE" ] \
	    && echo SKIPPING: $HOME/.$FILE \
	    && continue
    echo touching: $HOME/.$FILE 
    echo export MUSE=$MUSE      >> $HOME/.$FILE
    echo source $ROOT/$FILE     >> $HOME/.$FILE  
done

