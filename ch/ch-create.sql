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
) ENGINE = MergeTree ORDER BY (id)



