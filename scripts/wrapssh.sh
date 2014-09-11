#!/bin/sh
#This script wraps the SSH command and runs start and stop scripts based on the 
#hostname, assuming that they exist.

#Use your .bash_profile to alias this script to ssh, like so: 
#alias ssh=~/.ssh/scripts/wrapssh.sh

# You can return something from your startscript that will then be passed to you
# stop script.

#Host Name is the last argument, minus anything before an @ sign
eval LASTARG=\$$#
HOST=`echo $LASTARG | sed -e 's/.*@//'`

STARTSCRIPT="$HOME/.ssh/scripts/start_$HOST.sh"
STOPSCRIPT="$HOME/.ssh/scripts/stop_$HOST.sh"

if [ -x "$STARTSCRIPT" ]; then
    TAB=$($STARTSCRIPT)
fi
ssh $@
if [ -x "$STOPSCRIPT" ]; then
	TAB=`$STOPSCRIPT $TAB`
fi

