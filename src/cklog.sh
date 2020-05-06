#/bin/bash

step_id=`qe get workflow $1|tail -n 1 |awk '{print $4}'`
qe get logs $1 -s $step_id > $1.log
grep -i error $1.log
