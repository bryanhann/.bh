[[ -d $BORGVENV ]] || {
    echo installing python venv
    python3 -m venv $BORGVENV
    source $BORGVENV/bin/activate
    pip install virtualenv
    pip install virtualenvwrapper
    deactivate
}
cp $BORGVENV/bin/v* $BORGBIN
source virtualenvwrapper.sh
.remove-python () {
    rm -rf $BORGVENV
}
