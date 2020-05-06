#/bin/bash

L_LOOP=1
while [ $L_LOOP == 1 ]
do
	prompt=`qe get workflowresult $1|tail -n 1`
	title=`echo $prompt|awk '{print $1}'`
	if [ -z $title ] && [ $title == "Location:" ]
	then
		L_LOOP=0
		url=`echo $prompt|awk '{print $2}'`
		wget --content-disposition $url
	else
		echo "Still waiting..."
		sleep 1
	fi
done

