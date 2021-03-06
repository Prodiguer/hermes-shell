===================================
HERMES Shell - Environment Variables
===================================

The HERMES platform is distributed across different types of machine.  Code running upon each machine requires access to sensitive information such as passwords & server addresses.  All such information is stored in environment variables details of which are listed below.

**Note 1** The list of supported machine types are: db, mq, web & dev.  Some variables are required across all machines (particulary if your machine is setup for development).

**Note 2** If you need to generate passwords then please do so using `this tool <http://passwordsgenerator.net>`_ .

General Variables
----------------------------

**HERMES_HOME**

* Description:	Path to local HERMES home directory.

* Machines:		all

* Default:		$HOME/hermes

**HERMES_DEPLOYMENT_MODE**

* Description:	Mode of deployment.

* Machines:		all

* Default:		dev

* Allowed:		dev | test | prod

**HERMES_MACHINE_TYPE**

* Description:	Type of machine onto which stack is deployed.

* Machines:		all

* Default:		dev

* Allowed:		db | dev | mq | web

**HERMES_CLIENT_WEB_URL**

* Description:	Web service url from HERMES client.

* Machines:		mq, dev

* Default:		https://hermes.upmc.ipsl.fr

DB server variables
----------------------------

**HERMES_DB_MONGO_HOST**

* Description:	MongoDB server hostname & port.

* Machines:		all

* Default:		localhost:27017

**HERMES_DB_MONGO_USER_PASSWORD**

* Description:	MongoDB password for the hermes-db-mongo-user account.

* Machines:		all

**HERMES_DB_PGRES_HOST**

* Description:	PostgreSQL server hostname & port.

* Machines:		all

* Default:		localhost:5432

**HERMES_DB_PGRES_PGDUMP**

* Description:	HERMES PostgreSQL pgdump executable path.

* Machines:		all

* Default:		/usr/bin/pg_dump

MQ server variables
----------------------------

**HERMES_MQ_RABBIT_HOST**

* Description:	RabbitMQ server hostname & port.

* Machines:		mq, dev

* Default:		localhost:5671

**HERMES_MQ_RABBIT_PROTOCOL**

* Description:	RabbitMQ sever protocol (i.e. whether to communicate over ssl).

* Machines:		mq, dev

* Default:		ampq

**HERMES_MQ_RABBIT_LIBIGCM_USER_PASSWORD**

* Description:	RabbitMQ password for the libigcm-mq-user account.

* Machines:		mq, dev

**HERMES_MQ_RABBIT_USER_PASSWORD**

* Description:	RabbitMQ password for the hermes-mq-user account.

* Machines:		mq, dev

**HERMES_MQ_RABBIT_SSL_CLIENT_CERT**  (if client ssl cert used)

* Description:	Client ssl cert file path.

* Machines:		mq, dev

**HERMES_MQ_RABBIT_SSL_CLIENT_KEY**  (if client ssl cert used)

* Description:	Client ssl key file path.

* Machines:		mq, dev

**HERMES_MQ_IMAP_MAILBOX**

* Description:	IMAP mailbox from which emails are pulled.

* Machines:		mq, dev

* Default:		AMPQ-TEST

**HERMES_MQ_IMAP_PASSWORD**

* Description:	IMAP server password for the _superviseur_ account.

* Machines:		mq, dev

**HERMES_MQ_SMTP_PASSWORD**

* Description:	SMTP server password for the _superviseur_ account.

* Machines:		mq, dev

Web server variables
----------------------------

**HERMES_WEB_COOKIE_SECRET**

* Description:	Secret cookie key associated with valid web service requests.

* Machines:		web, dev

**HERMES_WEB_PORT**

* Description:	Web server port number.

* Machines:		web, dev

* Default:		8888

**HERMES_WEB_URL**

* Description:	Web service url.

* Machines:		mq, dev

* Default:		http://localhost:8888
