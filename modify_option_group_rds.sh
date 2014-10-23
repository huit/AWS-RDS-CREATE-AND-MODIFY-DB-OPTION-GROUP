#!/bin/bash

# This is the driver script to Add and Option to an AWS RDS Database Option Group

# Set argument option

ARGC=$#
ARGV=${*:-}


# Load Option parameters from environment file

. ./setEnv.sh

#
# Set AWS Profile
#

AWS_CMD_PROFILE=" --profile ${PROFILENAME}"

#
# AWS RDS add option to option group command line and options
#

CMD="aws $AWS_CMD_PROFILE rds add-option-to-option-group"

if [ $APPLYIMMEDIATELY = "TRUE" ]
then
   CMD="$CMD --apply-immediately"
fi

usage () {
   echo "Usage: modify_option_group-rds.sh <TDE/SQLNET_ENC/OEM>"
   echo
   echo "This script, depending upon the Option input parameter supplied above."
   echo "will add an option to an AWS database Option Group."
   echo 
   echo "The full AWS command run by the script is:"
   echo
   echo "${CMD} --option-group-name OPTIONGROUPNAME --options file://./resources/options<optiontemplate>.json "
   echo
   echo "where OPTIONGROUPNAME as well as Option Group elements are set via variable in setEnv.sh"
   echo
   echo "options<optiontemplate>.json is a file containing the JSON template for the"
   echo "option being added.  This JSON file is auto built per Option depending upon the"
   echo "Option Group elements chosen:"
   echo
   echo "TDE --> Oracle TDE - options_tde_template.json"
   echo "SQLNET_ENC --> Oracle SQLNET Encryption - options_sqlnet_encr_template.json"
   echo "OEM --> Oracle Enterprise Manager control - options_oem_template.json"
   echo
   echo "Support for other Options including those for mySQL and SQLServer will be"
   echo "added in future revisions to this script."
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

# Otherwise record the Option chose from the command-line argument

if [ $ARGC -ne 1 ]
then
        usage
        exit 2
fi

option=$1

echo "Option Selected is:  --->" $option

if [ ${option} = "SQLNET_ENC" ]
then

   # Make runtime JSON template from Option template injected with Option environment variables

   ./bin/makeoption_json_sqlnet_enc

   #
   # Echo AWS command to be run and then run it
   #

   CMD="$CMD --option-group-name $OPTIONGROUPNAME --options file://./resources/options${option}.json"
   echo "Command to execute:"
   echo "-----------------------"
   echo $CMD

   $CMD

elif [ ${option} = "TDE" ]
then

   # Note that TDE has no configurable no options so the base TDE JSON template does
   # not have to be injected with any environment variables.
   #
   # Echo AWS command to be run and then run it
   #

   CMD="$CMD --option-group-name $OPTIONGROUPNAME --options file://./resources/options${option}.json"
   echo "Command to execute:"
   echo "-----------------------"
   echo $CMD

   $CMD

elif [ ${option} = "OEM" ]
then

   # Make runtime JSON template from Option template injected with Option environment variables

   ./bin/makeoption_json_oem

   #
   # Echo AWS command to be run and then run it
   #

   CMD="$CMD --option-group-name $OPTIONGROUPNAME --options file://./resources/options${option}.json"
   echo "Command to execute:"
   echo "-----------------------"
   echo $CMD

   $CMD

else
  echo "No valid option chosen to add to Option Group"
fi
 

