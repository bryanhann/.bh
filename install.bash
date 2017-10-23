##################################################################
# Confirm that this script was called from within its own 
# directory (not called from any other directory, and not
# sourced. This directory should NOT be on $PATH. 
##################################################################

[ "$0" == "./install.bash" ] || echo try \'./install.bash\' 
[ "$0" == "./install.bash" ] || exit

echo source \$HOME/.toolman   > $HOME/.improvement
echo export MUSE=$PWD               >> $HOME/.improvement
echo source \$MUSE/activate.bash    >> $HOME/.improvement

for FILE in `ls $PWD/root` ; do 
    [ "$1" == "--force" ] && rm $HOME/.$FILE
    ln -s $PWD/root/$FILE      $HOME/.$FILE  
done

echo
echo LOGGING IN
bash --login
echo LOGGED OUT
