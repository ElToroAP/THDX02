#!/bin/bash

echo "Starting Code Coverage Calculations"
varMinCC=75
varCC=`sfdx force:data:soql:query -t -q "SELECT PercentCovered FROM ApexOrgWideCoverage" -r json | jq '.result.records[0].PercentCovered'`

#Test results
if [ "$varCC" -lt "$varMinCC" ] ; then
    echo "Not enough code coverage ($varCC%)"
	exit -1
else
    echo "Enough code coverage ($varCC%)"
	exit 0
fi


