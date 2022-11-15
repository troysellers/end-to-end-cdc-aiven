
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
  plan         = var.aiven_plan
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

# Kafka Service
resource "aiven_kafka" "kafka-service" {
  project                 = var.aiven_project_name
  cloud_name              = var.aiven_cloud
  plan                    = var.aiven_plan
  service_name            = "${var.service_prefix}service-kafka"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"

  kafka_user_config {
    kafka_connect   = true
    kafka_rest      = true
    kafka_version   = "3.2"
    schema_registry = true
    kafka {
      auto_create_topics_enable    = true
    }
  }
}

resource "aiven_kafka_connect" "kafka-connect-service" {
  project = var.aiven_project_name
  cloud_name = var.aiven_cloud
  plan = var.aiven_plan
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
 depends_on = [aiven_service_integration.kafka-connect-integration]
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
    "include.schema.changes" = "false",
    "key.converter" = "org.apache.kafka.connect.json.JsonConverter",
    "value.converter" = "org.apache.kafka.connect.json.JsonConverter",
    "slot.name" = "debezium",
    "publication.name" = "debezium_publication",
    "decimal.handling.mode" = "string",
    "key.converter.schemas.enable" = "false",
    "value.converter.schemas.enable" = "false",
    "include.schema.changes" = "false",
    "transforms" = "extractState",
    "transforms.extractState.type" = "io.debezium.transforms.ExtractNewRecordState"
  }
}

# M3 Service
resource "aiven_m3db" "m3db-metrics" {
  project      = var.aiven_project_name
  cloud_name   = var.aiven_cloud
  plan         = "startup-8"
  service_name = "${var.service_prefix}metrics-m3db"
}


resource "aiven_grafana" "grafana" {
  project      = var.aiven_project_name
  cloud_name   = var.aiven_cloud
  plan         = "startup-4"
  service_name = "${var.service_prefix}metrics-grafana"
}

#Clickhouse service
resource "aiven_clickhouse" "clickhouse" {
  project                 = var.aiven_project_name
  cloud_name              = var.aiven_cloud
  plan                    = "startup-beta-8"
  service_name            = "${var.service_prefix}clickhouse"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"
}

#Service integration - PostgreSQL 
resource "aiven_service_integration" "pg-metrics" {
  project                  = var.aiven_project_name
  integration_type         = "metrics"
  source_service_name      = aiven_pg.postgres-service.service_name
  destination_service_name = aiven_m3db.m3db-metrics.service_name
}

#Service integration - Kafka 
resource "aiven_service_integration" "kafka-metrics" {
  project                  = var.aiven_project_name
  integration_type         = "metrics"
  source_service_name      = aiven_kafka.kafka-service.service_name
  destination_service_name = aiven_m3db.m3db-metrics.service_name
}

#Service integration - Grafana 
resource "aiven_service_integration" "int-grafana-m3db" {
  project                  = var.aiven_project_name
  integration_type         = "dashboard"
  source_service_name      = aiven_grafana.grafana.service_name
  destination_service_name = aiven_m3db.m3db-metrics.service_name
}

