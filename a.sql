CREATE TABLE category (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE products (
    product_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    price REAL,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE nutritions (
    nutrition_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER,
    name TEXT,
    calories INTEGER,
    fats REAL,
    sugar INTEGER,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_time DATETIME,
    address TEXT,
    customer_name TEXT,
    customer_ph TEXT,
    total_price REAL
);

CREATE TABLE products_orders
(
    order_id INTEGER,
    product_id INTEGER,
    amount INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
