#/bin/bash

qe submit workflow $1 |tee .out.log
WFID=`grep "Workflow ID:" .out.log|awk ‘{print $3}’`
echo `date`: $WFID >> ~/QEJOBS.db
