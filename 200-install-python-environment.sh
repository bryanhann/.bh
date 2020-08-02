[[ -d $BORGVENV ]] && {
    .note python is already installed
} || {
    .note installing python
    .exec python3 -m venv $BORGVENV
    .source $BORGVENV/bin/activate
    .exec pip install virtualenv
    .exec pip install virtualenvwrapper
    .exec deactivate
    .note copying fresh \'virtualenv\*\' files to \$BORGBIN
    cp $BORGVENV/bin/v* $BORGBIN
}


.note defining function .remove-python
function .remove-python () { rm -rf $BORGVENV; }

#.exec source virtualenvwrapper.sh
