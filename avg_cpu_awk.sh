#! /bin/bash
#
# This script will take the average of cpu utilization on daily basis for last 7 days.
#
# Created on Oct 29,2016
#
#

PATH_NAME=/var/log/sa
FILE=`ls -ltr $PATH_NAME|tail -1|awk '{print $NF}'`					#NF=Total number of fields
echo "`date +DATE:%m/%d/%y` -->`sar -f $PATH_NAME/$FILE|awk -f /home/script/program.awk`">/home/script/cpu_utilization.txt

echo "`date +DATE:%m/%d/%y` --> The % memory utilized is :`sar -r | tail -1| awk '{print $4}'`"



++++++++++++++++++++++++++++++++++++++++++


BEGIN{
printf "This is the average"
}
$NF ~ /[0-9]/ {
sum+=$NF
a+=1
}
END{
avg=sum/a
}
{
printf ":" avg "%\n"
}
