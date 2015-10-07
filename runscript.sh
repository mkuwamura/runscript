#!/bin/bash

_STARTTIME=`date '+%Y/%m/%d %H:%M:%S'`
_RUNENDFILE="/var/log/"${0##*/}"_runend.log"
_PIDFILE="/tmp/"${0##*/}".pid"

_runcheck() {
if [ $? -eq 0 ]
then
_ENDTIME=`date '+%Y/%m/%d %H:%M:%S'`
echo "end :"$_ENDTIME >> $_RUNENDFILE
logger  "$0 is successful."
rm -f $_PIDFILE
exit 0
else
logger  "$0 is running_error."
fi
exit 0
}

if [ ! -e $_PIDFILE ]
then
echo $$ > $_PIDFILE
echo "start:"$_STARTTIME >> $_RUNENDFILE

#run scripts

_runcheck

else
logger -p "$0 is duble running_error $_PIDFILE."
exit 1
fi