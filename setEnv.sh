# This environment variable contains environment variables which must
# be set to both create an AWS Database Option Group and to
# configure Options for an AWS Database Option group

# Set variables in each section for the Option being configured
# You must provide a value for each variable listed


# Set AWS profile name

export PROFILENAME=huitdba

# Set Environment for Option Group creation or modify

export OPTIONGROUPNAME=oraoptgrpgeneral
export ENGINENAME=oracle-ee
export MAJORENGINEVERSION=11.2
export DESCRIPTION=Oracle_General_Option_Group
export TAGKEY=name
export TAGVALUE=HUITDBA

export APPLYIMMEDIATELY=TRUE

# Set Environmnet for Oracle SQLNET ENCRYPTION

export CRYPTOCSUMTYPESERVER="SHA1,MD5"
export ENCTYPESERVER="AES128"
export CRYPTOCSUMSERVER="REQUIRED"
export ENCSERVER="REQUIRED"

# Set Environment for Oracle TDE

# No variables required for TDE

# Set Environmnet for Oracle OEM

export PORT=8080
export DBSECGRP=default


