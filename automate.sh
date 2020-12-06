#!/bin/bash

echo -en "Enter your input: \n 1.Website access logs \n 2. Concurrent Apache connections \n"
read n

weblog()
{
	echo "Checking home directory logs..."
	# sleep 1
	if [[ -d "/home/" ]] ; then
	cat /home/*/access-logs/* | awk '{print $1}' | sort | uniq -c | sort -rn	| head -10
	fi
}

concur()
{
	ss -at | grep ESTAB | awk '{print $5}' | cut -d":" -f1 | sort | uniq -c | sort -n
}

case $n in
1) weblog ;;
2) concur ;;
esac