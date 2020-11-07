#! /bin/bash
#
# This script will restart ssh service once the threshold limit is exceeded.
# The current limit in exftpd is 300
# Created on Oct 05,2015
#
#

OS=`uname`
HOST=`hostname`
IP=`nslookup $HOST | grep -i Address | tail -1 | cut -d':' -f2`
LOG_FILE="/opt/TMWD/script/sshd_restart_log"


case $OS in
    Linux)
        x=`netstat -an | grep -w $IP:22|grep ESTABLISHED|wc -l`


        if [ $x -gt 250 ]
                then
                        echo "`date +DATE:%m/%d/%y%tTIME:%H:%M:%S` : The current ssh count is $x .... Restarting ssh service" >> $LOG_FILE
                        /opt/TMWD/ST/bin/stop_sshd && /opt/TMWD/ST/bin/start_sshd
                        echo "`date +DATE:%m/%d/%y%tTIME:%H:%M:%S` :  The ssh service has been restarted" >> $LOG_FILE
                        mailx -s "SSH Service Restarted on: `uname -n` @ `date +DATE:%m/%d/%y%tTIME:%H:%M:%S`" dl-it-ftp-support@symantec.com < /dev/null
                else
                        echo "`date +DATE:%m/%d/%y%tTIME:%H:%M:%S` : The current ssh count is $x" >> $LOG_FILE
        fi
        ;;

    SunOS)

        x=`netstat -an | grep -w $IP.22|grep ESTABLISHED|wc -l`


        if [ $x -gt 250 ]
                then
                        echo "`date +DATE:%m/%d/%y%tTIME:%H:%M:%S` : The current ssh count is $x .... Restarting ssh service" >> $LOG_FILE
                        /opt/TMWD/ST/bin/stop_sshd && /opt/TMWD/ST/bin/start_sshd
                        echo "`date +DATE:%m/%d/%y%tTIME:%H:%M:%S` : The ssh service has been restarted" >> $LOG_FILE
                        mailx -s "SSH Service Restarted on: `uname -n` @ `date +DATE:%m/%d/%y%tTIME:%H:%M:%S`" dl-it-ftp-support@symantec.com < /dev/null
                else
                        echo "`date +DATE:%m/%d/%y%tTIME:%H:%M:%S` : The current ssh count is $x" >> $LOG_FILE
        fi

        ;;
esac

#
#
#The logs in the file are deleted in every 2 weeks
#

y=`cat $LOG_FILE | wc -l`

                if [ $y -gt 1400 ]
                                then
                                        cat /dev/null > $LOG_FILE

                fi