#!/bin/bash

file="/home/sagar.sh"

if [ -f $file ]
	then 

		echo -e "\n`date` : The content of the file is as below:">> /home/log.txt
		cat /home/sagar.sh >> /home/log.txt

	else 

		echo -e "\n`date` : File not found">>/home/log.txt

fi
