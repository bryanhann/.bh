function venv.main { venv.firstrun; venv.install; venv.activate; venv.configure; venv.deactivate; }
function venv.install { .note installing venv; .exec python3 -m venv $BORG_VENV; }
function venv.remove { .note removing venv; rm -rf $BORG_VENV; }
function venv.activate { .exec source $BORG_VENV/bin/activate; }
function venv.deactivate { .exec deactivate; }
function venv.firstrun {
    .firstrun || return
    .export VIRTUALENVWRAPPER_HOOK_DIR  ${BORG_LOCAL}/VIRTUALENVWRAPPER_HOOK_DIR
    .export VIRTUALENVWRAPPER_PYTHON    ${BORG_VENV}/bin/python
    .export WORKON_HOME                 ${BORG_LOCAL}/WORKON_HOME
    .export PROJECT_HOME                ${BORG_LOCAL}/PROJECT_HOME
    .exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
}
function venv.configure {
    .exec pip install --upgrade pip
    .exec pip install virtualenv
    .exec pip install virtualenvwrapper
    .exec pip install cat-in-a-box
}

venv.main


