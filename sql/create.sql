drop table if exists public.orders;

CREATE TABLE if not exists public.ORDERS (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    gender TEXT,
    street TEXT,
    town TEXT,
    mobile TEXT,
    country TEXT,
    drink_type TEXT,
    cost NUMERIC(10,2),
    addons TEXT,
    comments TEXt
);



