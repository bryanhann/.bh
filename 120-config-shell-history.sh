
##############################################################################
# History Configuration

##############################################################################

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=$BORGBUILD/HISTFILE     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately
