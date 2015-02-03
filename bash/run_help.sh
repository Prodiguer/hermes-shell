#!/bin/bash

# ###############################################################
# SECTION: HELP
# ###############################################################

# Displays help text to user.
run_help()
{
	helpers=(
		run_web_help
		run_db_help
		run_metric_help
		run_monitor_help
		run_mq_help
		run_stack_help
		run_tests_help
	)

	log "------------------------------------------------------------------"
	for helper in "${helpers[@]}"
	do
		$helper
		log "------------------------------------------------------------------"
	done
}

run_web_help()
{
	log "Web commands :"
	log "api" 1
	log "launches API" 2
	log

	log "api-heartbeat" 1
	log "indicates whether API is up and running" 2
	log

	log "api-list-endpoints" 1
	log "displays list of endpoints supported by API" 2
}

run_help_web()
{
	run_web_help
}

run_db_mongo_help()
{
	log "Mongo DB commands :"
	log "db-mongo-start" 1
	log "starts mongodb daemon" 2
	log

	log "db-mongo-stop" 1
	log "stops mongodb daemon" 2
	log

	log "db-mongo-restart" 1
	log "restarts mongodb daemon" 2
	log
}

run_db_pgres_help()
{
	log "PostGres DB commands :"
	log "db-backup" 1
	log "performs a backup of database" 2
	log

	log "db-install" 1
	log "installs database intiialised with setup data" 2
	log

	log "db-reset" 1
	log "uninstalls & installs database" 2
	log

	log "db-restore" 1
	log "restores database from backup" 2
	log

	log "db-uninstall" 1
	log "drops database" 2
	log
}

run_db_help()
{
	run_db_mongo_help
	run_db_pgres_help
}

run_help_db()
{
	run_db_help
}

run_metric_help()
{
	log "Metric web API commands :"
	log

	log "metric-add PATH" 1
	log "adds a group of metrics from a json file" 2
	log "PATH: path to a metrics file" 2
	log

	log "metric-add-batch PATH" 1
	log "adds batches of metrics from json files" 2
	log "PATH: path to a directory containing formatted metrics files" 2
	log

	log "metric-delete GROUP-ID [FILTER]" 1
	log "deletes a group of metrics" 2
	log "GROUP-ID: group identifier" 2
	log "FILTER: path to a metrics query filter file" 2
	log

	log "metric-fetch GROUP-ID INCLUDE-DB-FIELDS [FILTER]" 1
	log "fetches a group of metrics" 2
	log "GROUP-ID: group identifier" 2
	log "INCLUDE-DB-FIELDS: flag indicating whether db injected fields are to be returned" 2
	log "FILTER: path to a metrics query filter file" 2
	log

	log "metric-fetch-columns GROUP-ID [INCLUDE-DB-FIELDS]" 1
	log "fetches list of metric group columns" 2
	log "GROUP-ID: group identifier" 2
	log "INCLUDE-DB-FIELDS: flag indicating whether db injected columns are to be returned" 2
	log

	log "metric-fetch-count GROUP-ID [FILTER]" 1
	log "fetches number of lines within a metric group" 2
	log "GROUP-ID: group identifier" 2
	log "FILTER: path to a metrics query filter file" 2
	log

	log "metric-fetch-list" 1
	log "lists all metric group names" 2
	log

	log "metric-fetch-setup GROUP-ID [FILTER]" 1
	log "fetches a metric group's distinct column values" 2
	log "GROUP-ID: group identifier" 2
	log "FILTER: path to a metrics query filter file" 2
	log

	log "metric-format GROUP-ID FORMAT INPUT-DIR OUTPUT-DIR" 1
	log "formats metrics file(s) in readiness for upload" 2
	log "GROUP-ID: group identifier" 2
	log "FORMAT: format of input files (pcmdi | ipsl-extended)" 2
	log "INPUT-DIR: path to a directory containing unformatted metrics files" 2
	log "OUTPUT-DIR: path to a directory to which formatted files will be written" 2
	log

	log "metric-rename GROUP-ID NEW-GROUP-ID" 1
	log "renames a metric group" 2
	log "GROUP-ID: group identifier" 2
	log "NEW-GROUP-ID: new group identifier" 2
	log
}

run_help_metric()
{
	run_metric_help
}

run_monitor_help()
{
	log "Monitoring commands :"
	log "monitor-simulation SIMULATION_UID" 1
	log "monitors a simulation" 2
}

run_help_monitor()
{
	run_monitor_help
}

run_mq_help()
{
	log "Message Queue commands :"
	log "mq-configure" 1
	log "uploads RabbitMQ configuration file to RabbitMQ server" 2
	log

	log "mq-consume TYPE [THROTTLE]" 1
	log "runs a message consumer" 2
	log "TYPE = type of consumer to be run" 2
	log "THROTTLE = optional limit of number of messages to consume" 2
	log

	log "mq-daemons-init" 1
	log "initializes Prodiguer daemon process controller" 2
	log "mq-daemons-kill" 1
	log "stops Prodiguer MQ daemons & kills Prodiguer daemon process controller" 2
	log "mq-daemons-refresh" 1
	log "refreshes Prodiguer MQ daemons - i.e. reloads mq-supervisor.conf & restarts" 2
	log "mq-daemons-restart" 1
	log "restarts Prodiguer MQ daemons" 2
	log "mq-daemons-start" 1
	log "starts Prodiguer MQ daemons" 2
	log "mq-daemons-status" 1
	log "displays status of active Prodiguer MQ daemons" 2
	log "mq-daemons-stop" 1
	log "stops Prodiguer MQ daemons" 2
	log

	log "mq-produce TYPE [THROTTLE]" 1
	log "runs a message producer" 2
	log "TYPE = type of producer to be run" 2
	log "THROTTLE = optional limit of number of messages to produce" 2
	log

	log "mq-purge" 1
	log "deletes all messages from all queues" 2
	log

	log "mq-reset" 1
	log "deletes all vhosts, exhanges, queues and users from RabbitMQ server" 2
}

run_help_mq()
{
	run_mq_help
}

run_stack_help()
{
	log "Stack commands :"
	log "stack-bootstrap" 1
	log "prepares system for install " 2
	log

	log "stack-config-commit" 1
	log "commits local changes to configuration templates" 2
	log

	log "stack-config-decrypt" 1
	log "decrypts & extracts configuration files" 2
	log "MODE = deployment mode [test | prod]" 2
	log "SERVER-TYPE = type of server [web | mq | db]" 2
	log

	log "stack-config-encrypt" 1
	log "compresses & encrypts configuration files" 2
	log "MODE = deployment mode [test | prod]" 2
	log "SERVER-TYPE = type of server [web | mq | db]" 2
	log

	log "stack-install" 1
	log "installs complete stack" 2
	log

	log "stack-install-repo" 1
	log "installs a prodiguer github repo" 2
	log "NAME = name of repo to be installed" 2
	log

	log "stack-install-repos" 1
	log "installs all prodiguer github repo" 2
	log

	log "stack-update" 1
	log "updates full stack (i.e. shell, repos, config and virtual environments)" 2
	log

	log "stack-update-config" 1
	log "updates local configuration files" 2
	log

	log "stack-update-shell" 1
	log "updates shell" 2
	log

	log "stack-update-source" 1
	log "updates shell and git repos" 2
	log

	log "stack-update-repos" 1
	log "updates git repos" 2
	log

	log "stack-update-venvs" 1
	log "updates virtual environments" 2
	log

	log "stack-uninstall" 1
	log "uninstalls stack & virtual environments" 2
}

run_help_stack()
{
	run_stack_help
}

run_tests_help()
{
	log "Unit test commands :"
	log "tests" 1
	log "runs all unit tests" 2

	log "tests-api" 1
	log "runs all api unit tests" 2
	log

	log "tests-api-utils-ep" 1
	log "runs api endpoint unit tests" 2
	log

	log "tests-api-utils-ws" 1
	log "runs api web-socket unit tests" 2
	log

	log "tests-api-metric" 1
	log "runs api simulation metrics unit tests" 2

	log "tests-cv" 1
	log "runs controlled vocabulary unit tests" 2

	log "tests-db" 1
	log "runs all database unit tests" 2
	log

	log "tests-db-main" 1
	log "runs main database unit tests" 2
	log

	log "tests-db-mq-hooks" 1
	log "runs message queue to database unit tests" 2
	log

	log "tests-db-types" 1
	log "runs database types unit tests" 2

	log "tests-mq" 1
	log "runs message queue unit tests" 2

	log "tests-utils-convert" 1
	log "runs conversion utility unit tests" 2
	log

	log "tests-utils-config" 1
	log "runs configuration utility unit tests" 2
}

run_help_tests()
{
	run_tests_help
}

