[root@rohit script]# vi script.sh
#! /bin/bash
#
# Description:
# Author:
# Created on:
#
#

#ipa=$(hostname -i|cut -f2 -d ' ')
#hostn=$(hostname)

i=`cat /root/script/mqs.ini | grep -w "Name"| tail -n +2|awk -F = {'print $2'}|wc -l`

for (( c=1; c<=$i; c++ ))
do
   qmname=`cat /root/script/mqs.ini | grep -w "Name"| tail -n +2|awk -v a=$c -F = 'NR == a {print $2}'`
   echo "insert into table $qmname"
done
