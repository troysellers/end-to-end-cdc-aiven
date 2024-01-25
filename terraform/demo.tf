
data "aiven_service_component" "schema_registry" {
  project = var.aiven_project_name
  service_name = aiven_kafka.kafka-service.service_name
  component = "schema_registry"
  route = "dynamic"
}

data "aiven_project" "demo-project" {
  project = var.aiven_project_name
}

data "aiven_kafka_user" "kafka_admin" {
  project = var.aiven_project_name
  service_name = aiven_kafka.kafka-service.service_name

  # default admin user that is automatically created each Aiven service
  username = "avnadmin"

  depends_on = [
    aiven_kafka.kafka-service
  ]
}

locals {
  schema_registry_url = "https://${data.aiven_service_component.schema_registry.host}:${data.aiven_service_component.schema_registry.port}"
}

# PostgreSQL Service
resource "aiven_pg" "postgres-service" {

  project      = var.aiven_project_name
  cloud_name   = var.aiven_cloud
  plan         = var.pg_plan
  service_name = "${var.service_prefix}service-pg"
}

provider "postgresql" {
  alias           = "pg"
  host            = aiven_pg.postgres-service.service_host
  port            = aiven_pg.postgres-service.service_port
  database        = "defaultdb"
  username        = aiven_pg.postgres-service.service_username
  password        = aiven_pg.postgres-service.service_password
  sslmode         = "require"
  connect_timeout = 15
}

resource "aiven_connection_pool" "coffee_pool" {
  project       = var.aiven_project_name
  service_name  = aiven_pg.postgres-service.service_name
  database_name = "defaultdb"
  pool_mode     = "transaction"
  pool_name     = "mydbpool"
  pool_size     = 10
  username      = aiven_pg.postgres-service.service_username
  depends_on = [
    aiven_pg.postgres-service
  ]
}

resource "local_sensitive_file" "create_env" {
  content  = "DB_URI=${aiven_connection_pool.coffee_pool.connection_uri}\n"
  filename = "${path.module}/../producer/.env"
}

# Create aiven_extras extension for debezium source connector to work
resource "null_resource" "db_setup" {

  depends_on = [
    aiven_connection_pool.coffee_pool
  ]
  provisioner "local-exec" {
    command =  "psql  ${aiven_pg.postgres-service.service_uri} -f ${path.module}/aiven_extras.sql"

#    environment = {
#      PGPASSWORD = "${aiven_pg.postgres-service.service_password}"
#    }
  }
}

# Create and populate the tables required for the demo
resource "null_resource" "populate_db" {

  depends_on = [
    null_resource.db_setup
  ]
  provisioner "local-exec" {

    command = "psql ${aiven_pg.postgres-service.service_uri} -f ${path.module}/../producer/sql/create.sql"
#    environment = {
#      PGPASSWORD = "${aiven_pg.postgres-service.service_password}"
#    }
  }
}

# Kafka Service
resource "aiven_kafka" "kafka-service" {
  project                 = var.aiven_project_name
  cloud_name              = var.aiven_cloud
  plan                    = var.kafka_plan
  service_name            = "${var.service_prefix}service-kafka"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"

  kafka_user_config {
    kafka_connect   = true
    kafka_rest      = true
    kafka_version   = "3.5"
    kafka_version   = var.kafka_version
    schema_registry = true
    kafka {
      auto_create_topics_enable    = true
    }
  }
}

resource "aiven_kafka_connect" "kafka-connect-service" {
  project = var.aiven_project_name
  cloud_name = var.aiven_cloud
  plan = var.kc_plan
  service_name = "${var.service_prefix}kafka-connect"
  maintenance_window_dow = "sunday"
  maintenance_window_time = "10:00:00"
  depends_on = [aiven_kafka.kafka-service]
  kafka_connect_user_config {
    kafka_connect {
      consumer_isolation_level = "read_committed"
    }

    public_access {
      kafka_connect = true
    }
  }
}

resource "aiven_service_integration" "kafka-connect-integration" {
  project = var.aiven_project_name
  integration_type = "kafka_connect"
  source_service_name = aiven_kafka.kafka-service.service_name
  destination_service_name = aiven_kafka_connect.kafka-connect-service.service_name
  depends_on = [aiven_kafka_connect.kafka-connect-service, aiven_kafka.kafka-service]
}

# Debezium Source Connector
resource "aiven_kafka_connector" "kafka-pg-source-conn" {
  project        = var.aiven_project_name
  service_name   = aiven_kafka_connect.kafka-connect-service.service_name
  connector_name = "kafka-pg-source-conn"
 depends_on = [aiven_service_integration.kafka-connect-integration, null_resource.db_setup]
  config = {
    "name" = "kafka-pg-source-conn",
    "connector.class" = "io.debezium.connector.postgresql.PostgresConnector",
    "tasks.max" = "1",
    "database.server.name"     = aiven_pg.postgres-service.service_name,
    "database.hostname"        = aiven_pg.postgres-service.service_host,
    "database.port"            = aiven_pg.postgres-service.service_port,
    "database.user"            = aiven_pg.postgres-service.service_username,
    "database.password"        = aiven_pg.postgres-service.service_password,
    "database.dbname" = "defaultdb",
    "database.sslmode" = "require",
    "plugin.name" = "pgoutput",
    "key.converter" = "org.apache.kafka.connect.json.JsonConverter",
    "value.converter" = "org.apache.kafka.connect.json.JsonConverter",
    "slot.name" = "debezium",
    "publication.name" = "debezium_publication",
    "decimal.handling.mode" = "string",
    "key.converter.schemas.enable" = "false",
    "value.converter.schemas.enable" = "false",
    "include.schema.changes" = "false",
    "transforms" = "extractState",
    "publication.autocreate.mode": "filtered"
    "transforms.extractState.type" = "io.debezium.transforms.ExtractNewRecordState"
  }
}

#Clickhouse service
resource "aiven_clickhouse" "clickhouse" {
  project                 = var.aiven_project_name
  cloud_name              = var.aiven_cloud
  plan                    = var.ch_plan
  service_name            = "${var.service_prefix}clickhouse"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"
  depends_on = [
    aiven_kafka.kafka-service, aiven_pg.postgres-service
  ]

}

resource "aiven_service_integration" "clickhouse-kafka" {
    project                 = var.aiven_project_name
      integration_type = "clickhouse_kafka"
      source_service_name = aiven_kafka.kafka-service.service_name
      destination_service_name = aiven_clickhouse.clickhouse.service_name
}

resource "aiven_service_integration" "clickhouse-postgresql" {
    project                 = var.aiven_project_name
      integration_type = "clickhouse_postgresql"
      source_service_name = aiven_pg.postgres-service.service_name
      destination_service_name = aiven_clickhouse.clickhouse.service_name
}

resource "local_file" "create_sh" {
  content  = <<EOF

    INTEGRATION_ID=$(avn service integration-list --project ${var.aiven_project_name} ${aiven_clickhouse.clickhouse.service_name} --json | jq -r '.[] | select(.integration_type == "clickhouse_kafka" and .source == "${aiven_kafka.kafka-service.service_name}").service_integration_id')

    avn service integration-update $INTEGRATION_ID \
      --project ${var.aiven_project_name} \
      --user-config-json '{
        "tables": [
          {
              "name": "purchases_queue",
              "columns": [
                  {"name": "id" , "type": "Int64"},
                  {"name": "store_id" , "type": "Int64"},
                  {"name": "item_id", "type": "Int64"},
                  {"name": "customer_id" , "type": "Int64"},
                  {"name": "total_quantity" , "type": "Int64"},
                  {"name": "price" , "type": "Int64"},
                  {"name": "order_placed" , "type": "DateTime64(6,'UTC')"},
                  {"name": "order_collected" , "type": "DateTime64(6,'UTC')"}
              ],
              "topics": [{"name": "${aiven_pg.postgres-service.service_name}.public.purchase"}],
              "data_format": "JSONEachRow",
              "group_name": "purchase_clickhouse_consumer"
          }
        ]
      }'

    clickhouse client --host ${aiven_clickhouse.clickhouse.service_host} \
                  --secure \
                  --port ${aiven_clickhouse.clickhouse.service_port} \
                  --user ${aiven_clickhouse.clickhouse.service_username} \
                  --password ${aiven_clickhouse.clickhouse.service_password} \
                  < ../ch/ch-create.sql
    sleep 10
    EOF
  filename = "../ch/create.sh"
  file_permission = 0711
}

resource "local_file" "create_ch_mv" {
  content = <<EOF
  CREATE MATERIALIZED VIEW default.purchases_mv to default.purchases AS
    SELECT id, store_id, item_id, customer_id, total_quantity, roundBankers(divide(price,100),2) as price,
    order_placed, order_collected
    FROM `service_${aiven_kafka.kafka-service.service_name}`.purchases_queue
  EOF

  filename = "../ch/create_mv.sql"
  file_permission = 0444
}

# Create the table required for clickhouse
resource "null_resource" "create_ch_tables" {
  depends_on = [
    local_file.create_sh, aiven_clickhouse.clickhouse, aiven_kafka.kafka-service, aiven_service_integration.clickhouse-kafka
  ]
  provisioner "local-exec" {
    command = "${abspath(path.module)}/../ch/create.sh"
  }
}

# Create the materialised view for clickhouse
resource "null_resource" "create_ch_mv" {
    depends_on = [
    null_resource.create_ch_tables, local_file.create_ch_mv, aiven_clickhouse.clickhouse,aiven_kafka.kafka-service, aiven_service_integration.clickhouse-kafka
  ]
  provisioner "local-exec" {
    command = "clickhouse client --host ${aiven_clickhouse.clickhouse.service_host} --secure --port ${aiven_clickhouse.clickhouse.service_port} --user ${aiven_clickhouse.clickhouse.service_username} --password ${aiven_clickhouse.clickhouse.service_password} < ${abspath(path.module)}/../ch/create_mv.sql"
  }
}


