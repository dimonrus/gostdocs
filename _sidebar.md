# GOST project

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;helps you simplify PaaS development

* Getting started

  * [Quick start](quickstart.md)
  * [Create new project](new_project.md)
  * [Connect to Postgres](connect_postgres.md)
  * [Connect to RabbitMQ](connect_rabbit.md)
  * [Migration](migration.md)
    - [Schema](#schema)
    - [Data](#data)
    - [Run migration](#run-migration)
    - [Create new migration](#create-new-migration)
  * [Run as web api](run_as_web.md)
  * [Run as consumer](run_as_consumer.md)
  * [Run as script](run_as_script.md)
  * [Makefile commands](makefile_commands.md)
  * [Docker compose](docker_compose.md)

* Components
  * [Application](application.md)
    * [Logger](logger.md)
    * [Commander](commander.md)
  * [Config](config.md)
    * [Depends](depends.md)
    * [ENV](envs.md)
  * [IO](io.md)
    * [Web](web.md)
      * [Routes](routes.md)
      * [Middleware](middleware.md)
      * [API](api.md)
      * [Swagger](swagger.md)
      * [CRUD](crud.md)
    * [Consumer](consumer.md)
      * [Rabbit client](rabbit_client.md)
      * [Queues](queues.md)
      * [Generator](consumer_generator.md)
      * [Producer](producer.md)
      * [Subscriber](subscriber.md)
    * [DB](db.md)
      * [Transaction](transaction.md)
      * [Migrations](migrations.md)
      * [Models](models.md)
      * [Collections](collections.md)
      * [Generator](db_generator.md)
    * [Script](script.md)
      * [Generator](generators.md)
        * [Script](script_generator.md)
        * [CRUD](crud_generator.md)
        * [Model](model_generator.md)
        * [Consumer](consumer_generator.md)
        * [Migration](migration_generator.md)
      * [Parameters](parameters.md)
      * [Execute](execution.md)

* Best practice
  * [Business logic is core](business_core.md)
  * [SQL first style](sql_first.md)
  * [Create client for your API](create_client.md)

* Examples
  * [10k RPS entities into DB via HTTP](flusher_for_db.md)
  * [Fanout consumer](fanout_consumer.md)
  * [V2 API](v2_api.md)
  * [Crontab](crontab.md)

* Changelog
  * [V1 Released](v1_changelog.md)
