#!/bin/sh
SCRIPT_PATH=`python -c "import os; print os.path.realpath('$0')"`
SCRIPT_DIR=`dirname $SCRIPT_PATH`
cd $SCRIPT_DIR
./totoserver.py $@
