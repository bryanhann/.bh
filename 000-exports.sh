.export BORG $ZDOTDIR

.export BORG_VENV                   ~/.local/borg/VENV
.export ZSH                         ~/.local/borg/ZSH
.export BORG_REPOS                  ~/.local/borg/BORG_REPOS
.export WORKON_HOME                 ~/.local/borg/WORKON_HOME
.export PROJECT_HOME                ~/.local/borg/PROJECT_HOM
.export VIRTUALENVWRAPPER_HOOK_DIR  ~/.local/borg/VIRTUALENVWRAPPER_HOOK_DIR
.export HISTFILE                    ~/.local/borg/HISTFILE

mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME
mkdir -p $BORG_REPOS

.export PATH            $PATH:$BORG_VENV/bin
.export PYTHONPATH      $BORG/lib/python

.export HISTSIZE    5000            # How many lines of history to keep in memory
.export SAVEHIST    5000            # Number of history entries to save to disk
.export HISTDUP     erase           # Erase duplicates in the history file
.exec setopt appendhistory          # Append history to the history file (no overwriting)
.exec setopt sharehistory           # Share history across terminals
.exec setopt incappendhistory       # Immediately

