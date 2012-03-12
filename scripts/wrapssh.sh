#!/bin/sh
#This script wraps the SSH command and runs start and stop scripts based on the 
#hostname, assuming that they exist.

#Use your .bash_profile to alias this script to ssh, like so: 
#alias ssh=~/.ssh/scripts/wrapssh.sh

#Host Name is the last argument, minus anything before an @ sign
eval LASTARG=\$$#
HOST=`echo $LASTARG | sed -e 's/.*@//'`

STARTSCRIPT="$HOME/.ssh/scripts/start_$HOST.sh"
STOPSCRIPT="$HOME/.ssh/scripts/stop_$HOST.sh"

if [ -x "$STARTSCRIPT" ]; then
    `$STARTSCRIPT`
fi
ssh $@
if [ -x "$STOPSCRIPT" ]; then
	`$STOPSCRIPT`
fi

