_export dst     ${ZDOTBLD}/vwrap
_export src     https://github.com/bryanhann/bch.vwrap.git

[ -d ${dst}  ] || {
    git clone $src $dst
    pip install --cache-dir $PIP_DOWNLOAD_CACHE virtualenv
    pip install --cache-dir $PIP_DOWNLOAD_CACHE virtualenvwrapper
}

_export VIRTUALENVWRAPPER_HOOK_DIR  ${dst}/hooks
_export WORKON_HOME                 ${dst}/workon_home
_export PROJECT_HOME                ~/dev

source  virtualenvwrapper.sh
