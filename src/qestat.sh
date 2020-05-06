#/bin/bash

L_LOOP=1
while [ $L_LOOP == 1 ]
do
	qe get workflow $1|tee .out.log
	status=`grep "Status:" .out.log|awk '{print $2}'`
	rm .out.log
	echo $status
	if [ -z $status ] && [ $status == "Succeeded" ]
	then
		L_LOOP=0
		echo "Job $1 finished successfully"
	else
		sleep 1
	fi
done	

#watch -c "qe get workflow $1"

