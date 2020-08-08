#function _LOCAL_  { echo $(dirname $0)     }
#function _HOME_   { echo ${ZDOTDIR}         }

#function _VENV_   { echo $(_LOCAL_)/VENV    }
#function _VENDOR_ { echo $(_HOME_)/vendor  }
#bh0firstrun && {
#    bh0export PATH            $PATH:$(_VENV_)/bin
#    bh0export PYTHONPATH      $(_HOME_)/lib/python
#}

