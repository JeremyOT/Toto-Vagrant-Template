SCRIPT_PATH=`readlink -f $0`
SCRIPT_DIR=`dirname $SCRIPT_PATH`
cd $SCRIPT_DIR
./totoserver.py $@
