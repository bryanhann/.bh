r20.note.sh "    pip: installing $1"
pip list | grep "^$1 " && exit 0
echo
pip install $1
echo
