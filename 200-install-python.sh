[[ -d $BORGVENV ]] || {
    echo installing python venv
    rm -rf $BORGVENV
    python3 -m venv $BORGVENV
    source $BORGVENV/bin/activate
    # here we expect internet connectivity:
    pip install --upgrade pip
    pip install virtualenv
    pip install virtualenvwrapper
    # here we copy missing files in case of no internet:
    # (user should do an internet reinstall later!)
    cp -n $BORGHOME/vendor/venv/* $BORGVENV/bin
}

.workon () {
    if [[ "$1" == "borg" ]]; then
        source ${BORGVENV}/bin/activate
        source virtualenvwrapper.sh
    else
        workon $*
    fi
}

.remove-python () {
    rm -rf $BORGVENV
}

.workon borg
