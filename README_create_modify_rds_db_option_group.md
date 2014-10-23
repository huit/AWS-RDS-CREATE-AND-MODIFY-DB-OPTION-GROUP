AWS RDS DB Option Group Create and Modify Utility
====================================================

Welcome to the HUIT Infrastructure AWS RDS DB Option Group Create and Modify Utility


## Quickstart

To use this utility, refer to help method within utility by running the following:


```
$> ./create_option_group_rds.sh -h

$> ./modify_option_group_rds.sh -h
```

All environment variables required to use these utilities must be set in setEnv.sh

To apply an Option Group change immediately to all databases to which this Option Group is assigned,
set environment variable APPLYIMMEDIATELY=TRUE

## File Notes

BIN directory contains:  Python scripts which inject environment variables in JSON templates
RESOURCES directory contains:  JSON templates used to build Option Group options







