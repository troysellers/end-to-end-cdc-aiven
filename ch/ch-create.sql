CREATE TABLE default.orders
(
    id Int64,
    first_name String,
    last_name String,
    email String,
    gender String,
    street String,
    town String,
    mobile String,
    country String,
    drink_type String,
    cost Float64,
    addons String,
    comments String
) ENGINE = MergeTree ORDER BY (id);

CREATE MATERIALIZED VIEW default.orders_mv TO default.orders AS 
SELECT id, first_name, last_name, email, gender, 
            street, town,  mobile, country, drink_type, 
            toFloat64OrZero(cost) as cost, addons, comments
FROM `service_cloud-expo-service-kafka`.orders_queue;