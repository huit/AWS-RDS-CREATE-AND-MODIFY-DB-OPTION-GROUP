#!/bin/bash

# This is the driver script to create an AWS RDS Database Option Group

# Load Option parameters from environment file

. ./setEnv.sh

#
# Set AWS Profile
#

AWS_CMD_PROFILE=" --profile ${PROFILENAME}"

#
# AWS RDS option group create command line and options
#

CMD="aws $AWS_CMD_PROFILE rds create-option-group "

usage () {
   echo "Usage: ${CMD} --engine-name <VALUE> --major-engine-version <VALUE> --description <VALUE>"
   echo
   echo "where VALUE is set via setEnv.sh"
   echo
   echo
}

# Execute usage block above when user supplies h as script paremeter

while getopts :h option
do
        case $option in
        "h")
                usage
                exit ${EXIT_STATUS}
                ;;
         esac
done

#
# Echo AWS command to be run and then run it
#
CMD="$CMD --option-group-name $OPTIONGROUPNAME --engine-name $ENGINENAME --major-engine-version $MAJORENGINEVERSION --option-group-description $DESCRIPTION --tags Key=$TAGKEY,Value=$TAGVALUE"
echo "Command to execute:"
echo "-----------------------"
echo $CMD

$CMD

