_export () { export $1=$2 ; }
##########################################################################\
_export DOT  ${HOME}/.config/bch/dotfiles
_export CFG  ${HOME}/.config/bch
_export BLD  ${HOME}/.local/__BCH__
_export URL  https://github.com/bryanhann
##########################################################################\
function DOTFILES_install   {
    echo "source ${DOT}/dot.profile.sh  ##" > ~/.profile
    echo "source ${DOT}/dot.bashrc.sh   ##" > ~/.bashrc
    echo "source ${DOT}/dot.zprofile.sh ##" > ~/.zprofile
    echo "source ${DOT}/dot.zshrc.sh    ##" > ~/.zshrc
}
##########################################################################\
function  VWRAP_root     { echo ${BLD}/vwrap;          }
function  VWRAP_url      { echo ${URL}/bch.vwrap.git; }
function  VWRAP_activate { source virtualenvwrapper.sh; }
function  VWRAP_install  {
    [ -d $(VWRAP_root) ] && return 0
    git clone $(VWRAP_url) $(VWRAP_root)
    pip install virtualenv
    pip install virtualenvwrapper
}
##########################################################################\
function  DUNDER_root     { echo ${BLD}/dunder;          }
function  DUNDER_url      { echo ${URL}/bch.dunders.git; }
function  DUNDER_activate { source $(DUNDER_root)/dunders.sh; }
function  DUNDER_install  {
    [ -d $(DUNDER_root) ] && return 0
    git clone $(DUNDER_url) $(DUNDER_root)
}
##########################################################################\
function  VENV_root     { echo ${BLD}/venv ; }
function  VENV_activate { source $(VENV_root)/bin/activate ; }
function  VENV_install  {
    [ -d $(VENV_root) ] && return 0
    D=$(VENV_root)
    python3 -m venv ${D}  || return 1;
    source ${D}/bin/activate
    pip install --upgrade pip
    #pip install virtualenv
    #pip install virtualenvwrapper
}
##########################################################################\
function  ZSH_root     { echo ${BLD}/zsh; }
function  ZSH_zprofile { echo ${DOT}/dot.zprofile.sh;  }
function  ZSH_zshrc    { echo ${DOT}/dot.zshrc.sh;  }
function  ZSH_url      { echo ${URL}/bch.shell.git; }
function  ZSH_zdotdir  { echo ${DOT}/zdotdir;  }
function  ZSH_install  {
    [ -d $(ZSH_root) ] && return 0
    git clone $(ZSH_url) $(ZSH_root)
}
##########################################################################\
function OMZSH_root    { echo ${BLD}/omzsh;  }
function OMZSH_url     { echo https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh ; }
function OMZSH_install {
    [ -d $(OMZSH_root) ] && return 0
    SCRIPT=/tmp/$RANDOM.$RANDOM.sh
    touch    ${SCRIPT}
    chmod +x ${SCRIPT}
    curl -fsSL $(OMZSH_url) > ${SCRIPT}
    ${SCRIPT} --unattended
    rm ${SCRIPT}
}

_export ZSH     $(OMZSH_root)
_export ZDOTDIR $(ZSH_zdotdir)
_export XDG_CONFIG_HOME             ${HOME}/.config
_export XDG_CACHE_HOME              ${HOME}/.cache
_export PIP_DOWNLOAD_CACHE          ${HOME}/.cache/pip
_export VIRTUALENVWRAPPER_HOOK_DIR  ${BLD}/vwrap/hooks
_export WORKON_HOME                 ${BLD}/vwrap/workon_home
_export PROJECT_HOME                ~/dev
