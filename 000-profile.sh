function _LOCAL_  { echo ~/.local/borg      }
function _HOME_   { echo ${ZDOTDIR}         }

function _VENV_   { echo $(_LOCAL_)/VENV    }
function _VENDOR_ { echo $(_HOME_)/vendor  }
.firstrun && {
    .export PATH            $PATH:$(_VENV_)/bin
    .export PYTHONPATH      $(_HOME_)/lib/python
}

