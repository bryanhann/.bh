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

