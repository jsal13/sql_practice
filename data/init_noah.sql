CREATE TABLE customers (
    customerid SERIAL,
    name VARCHAR(256),
    address VARCHAR(256),
    citystatezip VARCHAR(256),
    birthdate DATE,
    phone VARCHAR(16),
    timezone VARCHAR(64),
    lat FLOAT,
    long FLOAT,
    PRIMARY KEY (customerid)
);
CREATE TABLE orders (
    orderid SERIAL,
    customerid INTEGER,
    ordered TIMESTAMP,
    shipped TIMESTAMP,
    items VARCHAR(256),
    total FLOAT,
    PRIMARY KEY (orderid)
);
CREATE TABLE orders_items (
    orderid INTEGER,
    sku VARCHAR(16),
    qty INTEGER,
    unit_price FLOAT
);
CREATE TABLE products (
    sku VARCHAR(16),
    "desc" VARCHAR(256),
    wholesale_cost FLOAT,
    dims_cm VARCHAR(256),
    PRIMARY KEY (sku)
);
COPY customers
FROM '/docker-entrypoint-initdb.d/noahs-customers.csv' csv header;
COPY orders
FROM '/docker-entrypoint-initdb.d/noahs-orders.csv' csv header;
COPY orders_items
FROM '/docker-entrypoint-initdb.d/noahs-orders_items.csv' csv header;
COPY products
FROM '/docker-entrypoint-initdb.d/noahs-products.csv' csv header;