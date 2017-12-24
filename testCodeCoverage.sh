#!/bin/bash

echo "Start Code Coverage Calculations"
varMinCC=75
#varJQ="jq-osx-amd64"
varJQ="jq-linux64"
varCC=`sfdx force:data:soql:query -t -q "SELECT PercentCovered FROM ApexOrgWideCoverage" -r json -u CI_SO | ./$varJQ '.result.records[0].PercentCovered'`

#Test results
if [ "$varCC" -lt "$varMinCC" ] ; then
    echo "Not enough code coverage ($varCC%)"
	exit -1
else
    echo "Enough code coverage ($varCC%)"
	exit 0
fi


