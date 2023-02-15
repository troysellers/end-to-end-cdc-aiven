# Create CDC Pipeline with Aiven

This is an example of building a Change Data Capture pipeline using the Aiven platform. 

It intends to simulate the order flow from a national chain of coffee shops, there is over 1000 around Australia in this example. 
The producer app is a simple golang client that reads and writes to our database once the build is complete. 

## Pre-requisites  
* An [Aiven Account](#create-your-aiven-account) 
* The [Aiven CLI](https://docs.aiven.io/docs/tools/cli.html) installed
* A text editor of your choice
* This github repository cloned 
* psql commandline (or maybe something like [pgadmin](https://www.pgadmin.org/download/) installed)
* golang 1.19 - required to run the data producer
* [terraform](https://www.terraform.io/)
* [jq](https://stedolan.github.io/jq/) - required by the terraform build
* [Clickhouse client](https://clickhouse.com/docs/en/install#self-managed-install)  - required by the terraform build

> Install the AVN CLI from the instructions [here](https://docs.aiven.io/docs/tools/cli.html).


If you are more the "automated" type, jump to the [Build Using Terraform](#build-this-again-using-terraform) section at the bottom and launch away. 

However, if you like to click the buttons then follow along here.

## Create your Aiven Account
If you haven't already done this, create a new Aiven trial at the [signup page](https://console.aiven.io/signup). 

![Signup](img/1%20-%20signup.png)


## Create Postgres

Click on the `create service` button to get started with your new Postgres service. 

https://user-images.githubusercontent.com/768991/192938883-949af89b-a75d-44e3-8b80-7228aaaace53.mp4


Once your postgres service is up and running, we need to connect and configure the database for the following sections.

Get your credentials from the Postgres service in Aiven 

![pg creds](img/2%20-%20pgcreds.png)

*Note your connection string.* 


### Setup The CDC Configuration
The Aiven Postgres service will require some [setup in the database](https://docs.aiven.io/docs/products/kafka/kafka-connect/howto/debezium-source-connector-pg.html) we have just created.

You will need to install the aiven-extras extenstion and create a publication for all the tables.

First, connect to your postgres service
```console
$ psql <YOUR CONNECTION STRING>
```

> Be sure to remove the ?sslmode parameter when using the psql from local machine

Then, create the [aiven_extras](https://github.com/aiven/aiven-extras) postgres database extension
```sql
CREATE EXTENSION aiven_extras CASCADE; 

SELECT *
FROM aiven_extras.pg_create_publication_for_all_tables(
    'debezium_publication',
    'INSERT,UPDATE,DELETE'
    ); 
```

### Adding Data
Now, lets add some data. 

```
> cd producer
> go run aiven-coffee.go
```
leave that running and watch the orders get created. 
This will create at least 100 orders every minute, it's a bit random so you should get more than that.  

## Create Kafka


Click on the `create service` button to get started with your new Kafka service. 

https://user-images.githubusercontent.com/92002375/192944203-83e29756-90c1-481e-beba-13a2fe876f82.mp4

After creating the Kafka service, go to the `service overview` page and enable `Apache Kafka REST API (Karapace)` and the `Schema Registry (Karapace)`

Next, scroll down to `Advanced Configurations` and add in `kafka.auto_create_topics_enable`. Turn the configuration on and save advanced configuration. 

<img width="1434" alt="Screenshot 2022-10-07 at 1 24 52 PM" src="https://user-images.githubusercontent.com/92002375/194474892-968aa681-e2f4-4c5f-bae3-24ae106a7aa9.png">

## Create Kafka Connect 

Go to your Kafka service overview page, `manage integrations`, and select `Kafka Connect` to get started! 

https://user-images.githubusercontent.com/92002375/193548233-7d6f6797-ab78-4e71-9037-65f00d50ae3f.mp4

### Create Debezium Connector

https://user-images.githubusercontent.com/92002375/193753962-7124b560-8cf6-4173-8afa-a49586a82434.mp4

Go to Kafka service overview page > `manage integrations` > `Kafka connect`

Once your Kafka Connect service has completed building you then can create the Debezium - PostgreSQL Source connection. 
For this you will need to use the AVN CLI 

> Install the AVN CLI from the instructions [here](https://docs.aiven.io/docs/tools/cli.html).  This configuration is also possible using the Console UI

```console
> avn service connector create <YOUR KAFKA CONNECT SERVICE NAME> '{
    "name": "kafka-pg-source-conn",
    "transforms": "extractState",
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "tasks.max": "1",
    "key.converter": "org.apache.kafka.connect.json.JsonConverter",
    "database.server.name": "dotc-service-pg",
    "database.hostname": "<YOUR PG HOST>",
    "database.port": "<YOUR PG PORT>",
    "database.dbname": "defaultdb",
    "database.user": "avnadmin",
    "database.password": "<YOUR PG PASS>",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "plugin.name": "pgoutput",
    "slot.name": "debezium",
    "publication.name": "debezium_publication",
    "decimal.handling.mode": "string",
    "database.sslmode": "require",
    "include.schema.changes": "false",
    "key.converter.schemas.enable": "false",
    "value.converter.schemas.enable": "false",
    "transforms.extractState.type": "io.debezium.transforms.ExtractNewRecordState"
}'
```
Modify the JSON file with connection information from your `PostgreSQL service`. You can get your connection information by going to your PostgreSQL service overview tab.

When you see success here you should see a number of new Kafka topics have been created for you. 
Click into the topics and `Fetch Messages` to see the data that is flowing.

## Create Clickhouse

https://user-images.githubusercontent.com/92002375/194501434-6a2f743a-37cf-4502-81d3-a00e1574c336.mp4


## Configure Kafka -> Clickhouse

https://user-images.githubusercontent.com/92002375/194501462-c12ae651-120f-4fc2-8c8f-e664c9ee1f75.mp4

## Consume The Data Stream

So our last step is now to setup some tables in Clickhouse so the data in the Kafka topic is getting consumed. From the drawing at the start of our session you will see there are two Clickhouse tables we need to create, as well as a Clickhouse Materialised View. The reason we do this is because once you read data from the Kafka topic in Clickhouse, you advance the Consumer offset and so it is effectively a "query once only" behaviour in Clickhouse. So, we use that query to load data into a different table that allows user queries for analytics. 

You will find the topic name in your Kafka configuration, under the topics tab. 

> Clickhouse is still in beta so the only way for us to operate with the Clickhouse - Kafka integration today is via the AVN CLI client. You can install the AVN CLI from the instructions [here](https://docs.aiven.io/docs/tools/cli.html). 

Firstly, lets make sure we know the name of the topic that has been created in Kafka as a result of the Kafka Connect configuration. We require this so we can tell Clickhouse what topic to read the data from. 

```console
$> avn service integration-list <Your clickhouse service name>
SERVICE_INTEGRATION_ID                SOURCE                    DEST                      INTEGRATION_TYPE       ENABLED  ACTIVE  DESCRIPTION                                                                     
====================================  ========================  ========================  =====================  =======  ======  ================================================================================
(integration not enabled)             dotc-clickhouse     dotc-service-kafka  kafka_logs             false    false   Send service logs to Aiven Apache Kafka service or external Apache Kafka cluster
00b2961a-ae30-47c5-bc58-782ef67e0792  dotc-service-kafka  dotc-clickhouse     clickhouse_kafka       true     true    Access a Kafka cluster from ClickHouse
(integration not enabled)             dotc-service-pg     dotc-clickhouse     clickhouse_postgresql  false    false   Access a PostgreSQL database from ClickHouse
```

Now we can take that integration id and insert into this command. (this example below simply uses jq to pull that out of the above)
Be sure to update the `topics` element and the end of this command with the topic from your service if you have modified any of the default settings.

```console
INTEGRATION_ID=$(avn service integration-list --project <your_project_name> <your_clickhouse_service_name> --json | jq -r '.[] | select(.integration_type == "clickhouse_kafka" and .source == "<your_kafka_service_name>").service_integration_id')

    avn service integration-update $INTEGRATION_ID \
      --project ${var.aiven_project_name} \
      --user-config-json '{
        "tables": [
          {
              "name": "purchases_queue",
              "columns": [
                  {"name": "id" , "type": "Int64"},
                  {"name": "store_id" , "type": "Int64"},
                  {"name": "customer_id" , "type": "Int64"},
                  {"name": "total_quantity" , "type": "Int64"},
                  {"name": "price" , "type": "Int64"},
                  {"name": "order_placed" , "type": "DateTime('UTC')"},
                  {"name": "order_collected" , "type": "type": "DateTime('UTC')}
              ],
              "topics": [{"name": "<your_kafka_service_name>.public.purchase"}],
              "data_format": "JSONEachRow",
              "group_name": "purchase_clickhouse_consumer"
          }
        ]
      }'
```

Now we can create the Clickhouse tables, the scripts for this are in the `ch/ch-create.sql` file 

Open the Clickhouse service in the Aiven Console and look for the query editor. 

Create the Table
```sql
CREATE TABLE default.purchases
(
    id Int64,
    store_id Int64,
    item_id Int64,
    customer_id Int64,
    total_quantity Int64, 
    price Float64,
    order_placed DateTime('UTC'),
    order_collected DateTime('UTC'),
) ENGINE = MergeTree ORDER BY (id);
```

Create the Materialised View (the service name is the kafka service, this database is created as part of the Clickhouse integration)
```sql
CREATE MATERIALIZED VIEW default.purchases_mv to default.purchases AS
    SELECT id, store_id, item_id, customer_id, total_quantity, round(divide(price/100),2),
        order_placed, order_collected
    FROM `service_<your_kafka_service_name>`.purchases_queue;
```

Now, you should be able to determine the most popular drink in Australia!! 
```sql
select count(*) c, drink_type from default.orders group by drink_type order by c desc;
```


# Bonus Marks!! 
Did you make it to the end already? Still have time left in our workshop? Well done, I told you Aiven was simple and easy to use didn't I! :) 

You can now have a go at adding observability


## Create Observability Stack
https://user-images.githubusercontent.com/92002375/194501746-d95575d4-acf2-48b1-949b-c8d85563509b.mp4

The Aiven platform comes with the capability of spinning up observability pipelines with a few clicks of a button. Follow the video and try it out!

## View Observability Stack


https://user-images.githubusercontent.com/92002375/194501920-89e54eb0-09df-4056-aa90-9e47166ea1eb.mp4

Spinning up an observability stack comes with pre-populated panels that you can use immediately to monitor your services. 


## Build This Again Using Terraform

You can also interface with Aiven's platform through Infrastructure-As-Code such as [Terraform](https://registry.terraform.io/providers/aiven/aiven/latest/docs) or [Kubernetes](https://docs.aiven.io/docs/tools/kubernetes.html). We have provided example terraform scripts in the `./terraform` directory. 

The terraform directory contains an example of variables you need to populate in order to run. 

To execute simply
```console
$> cd terraform
$> cp variables.tf.example variables.tf
```
Now update your terraform variables.. these are listed below.

This is the Aiven [authentication token](https://docs.aiven.io/docs/platform/concepts/authentication-tokens)
```
variable aiven_api_token {
	type = string
	default = "<YOUR API TOKEN>"	
	description = "Aiven authentication token"
}
```

This is the [project](https://docs.aiven.io/docs/platform/concepts/projects_accounts_access) name that services will be created in
```
variable aiven_project_name {
	type = string
	default = "<YOUR AIVEN PROJECT>"	
	description = "Aiven project for resource creation"
}
```

This is the [cloud and region](https://docs.aiven.io/docs/platform/reference/list_of_clouds) you would like to run your services in
```
variable aiven_cloud { 
	type = string
	default = "aws-ap-southeast-2"
	description = "Cloud region for Aiven resources"
}
```

Services will be created with a prefix to idenitfy them in the [console](https://docs.aiven.io/docs/tools/aiven-console)
```
variable service_prefix {
	type = string
	default = "e2e-cdc-"
	description = "String prefix for service names" 
}
```

The [Aiven for Postgres plan](https://aiven.io/pricing?tab=plan-comparison&product=pg) that will be created. 
```
variable pg_plan {
	type = string
	default = "startup-4"
	description = "The Aiven postgres plan to create"
} 
```

The [Aiven for Apache Kafka plan](https://aiven.io/pricing?tab=plan-comparison&product=kafka) that will be created
Requires a minimum business-4 for Kafka Connect integration
```
variable kafka_plan {
	type = string
	default = "business-4"
	description = "The Aiven Kafka plan to create"
} 
```
The [Aivnen for Apache Kafka Connect plan](https://aiven.io/pricing?tab=plan-pricing&product=kafka_connect) that will be created
```
variable kc_plan {
	type = string
	default = "startup-4"
	description = "The Aiven Kafka Connect plan to create"
} 
```

The [Aiven for Clickhouse plan](https://aiven.io/pricing?tab=plan-comparison&product=clickhouse) that will be created
```
variable ch_plan {
	type = string
	default = "hobbyist"
	description = "The Aiven Clickhouse plan to create"
} 
```

Once your variables are ready it's quite simply
```
$> terraform init
$> terraform plan
$> terraform apply
```
Get a coffee and let it build...