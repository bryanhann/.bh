[[ -d $BORG_VENV ]] && {
    .note python is already installed
} || {
    .note installing python
    .exec python3 -m venv $BORG_VENV
    .source $BORG_VENV/bin/activate
    .exec pip install virtualenv
    .exec pip install virtualenvwrapper
    .exec deactivate
}
.note copying fresh \'virtualenv\*\' files to \$BORG_BIN
cp $BORG_VENV/bin/v* $BORG_BIN

.note defining function .remove-python
function .remove-python { --doc remove the python
    rm -rf $BORG_VENV;
}

.note the next line is redundant if omzsh is using plugin \'virtualenvwrapper\'
.source virtualenvwrapper.sh
