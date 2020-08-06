function venv.main {
    venv.firstrun;
}
function venv.firstrun {
    bh0firstrun || return
    bh0export VIRTUALENVWRAPPER_PYTHON    $(_VENV_)/bin/python
    bh0export VIRTUALENVWRAPPER_HOOK_DIR  $(_LOCAL_)/VIRTUALENVWRAPPER_HOOK_DIR
    bh0export WORKON_HOME                 $(_LOCAL_)/WORKON_HOME
    bh0export PROJECT_HOME                $(_LOCAL_)/PROJECT_HOME
    bh0exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
    bh0exec venv.install
}
function venv.install {
    venv.is_installed && return
    bh0exec python3 -m venv $(_VENV_);
    venv.is_installed
    venv.config
}
function venv.remove { bh0note removing venv; rm -rf $(_VENV_); }
function venv.activate { bh0exec source $(_VENV_)/bin/activate; }
function venv.deactivate { bh0exec deactivate; }

function venv.config {
    bh0exec venv.activate
    bh0exec pip install --upgrade pip
    bh0exec pip install virtualenv
    bh0exec pip install virtualenvwrapper
    bh0source $(_HOME_)/venv.post-config.sh
    bh0exec venv.deactivate
}
function venv.is_installed {
    [[ -d $(_VENV_) ]] && { bh0note venv is installed && return 0 }
    [[ -d $(_VENV_) ]] || { bh0note venv is not installed && return 1 }
}

venv.main


