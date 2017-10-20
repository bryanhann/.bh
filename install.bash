##################################################################
# Confirm that this script was called from within its own 
# directory (not called from any other directory, and not
# sourced. This directory should NOT be on $PATH. 
##################################################################

if [ ! "$0" == "./install.bash" ]; then
    echo "Try \"./install.bash\" "
    exit
fi

for fname in `ls $PWD/d` ; do
    [   -L "$HOME/.$fname" ] && rm $HOME/.$fname
    [   -e "$HOME/.$fname" ] && echo SKIPPING: $HOME/.$fname
    [ ! -e "$HOME/.$fname" ] && echo Linking:  $HOME/.$fname && ln -s $PWD/d/$fname $HOME/.$fname
done


