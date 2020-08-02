[[ -d $BorgVENV ]] && {
    .note python is already installed
} || {
    .note installing python
    .exec python3 -m venv $BorgVENV
    .source $BorgVENV/bin/activate
    .exec pip install virtualenv
    .exec pip install virtualenvwrapper
    .exec deactivate
    .note copying fresh \'virtualenv\*\' files to \$BorgBIN
    cp $BorgVENV/bin/v* $BorgBIN
}

.note defining function .remove-python
function .remove-python { --doc remove the python
    rm -rf $BorgVENV;
}

.note the next line is redundant if omzsh is using plugin \'virtualenvwrapper\'
.source virtualenvwrapper.sh
