source $HERMES_HOME/bash/init.sh

log "DB : truncating postgres monitoring tables ..."

psql -U hermes_db_admin -d $HERMES_PGRES_DB_NAME -q -f $HERMES_HOME/bash/db/sql/pgres_truncate_monitoring.sql

log "DB : truncated postgres monitoring tables"
