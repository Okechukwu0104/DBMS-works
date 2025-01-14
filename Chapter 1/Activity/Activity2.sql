use ecommerce_db;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(11) UNIQUE,
    password VARCHAR(20) UNIQUE,
    address VARCHAR(100)
);

create TABLE products(
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(20) NOT NULL,
description TEXT,
stock_quantity int,
category VARCHAR(100),
supplier_id int,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create TABLE Orders(
order_id int PRIMARY KEY,
user_id SERIAL,
order_date datetime,
total_amount DECIMAL(10, 2),
shipping_address VARCHAR(50),
order_status VARCHAR(10),
payment_method VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users(user_id) 
);
