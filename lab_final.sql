CREATE DATABASE Ecommerce;

CREATE TABLE customers (
    customer_id int,
    customer_name varchar(100),
    customer_phone char(11),
    customer_email varchar(20),
    customer_address varchar(50)
);

CREATE TABLE orders (
    order_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    customer_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY(customer_id) REFERENCES customers (customer_id)    
);

CREATE TABLE items (
   item_id INT,
   item_name VARCHAR(120),
   item_price NUMERIC,
   PRIMARY KEY (item_id)
);

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    PRIMARY KEY (order_id, item_id),	
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

CREATE TABLE IF NOT EXISTS customers_backup SELECT * FROM customers;
CREATE TABLE IF NOT EXISTS items_backup SELECT * FROM items;

INSERT INTO customers VALUES (1, 'x', '01711111111', 'x@gamil.com', 'Dhaka'),
(2, 'y', '01722222222', 'y@gamil.com', 'Khulna'),
(3, 'z', '01733333333', 'z@gamil.com', 'Noakhali');

INSERT INTO orders (order_id,customer_id) VALUES (1,1),(2,2),(3,3);
INSERT INTO items VALUES (1,'Mobile',5000.50),(2,'Mobile',10000.00),(3,'PC',500000.50);
INSERT INTO order_items VALUES (1,1),(2,2),(3,3);

ALTER TABLE items ADD COLUMN discount_percentage int;
ALTER TABLE items ADD COLUMN offer_price int;

SELECT item_id, item_name FROM items WHERE item_price NOT BETWEEN 10000 AND 30000;

SELECT customer_id, customer_name, customer_phone, customer_email FROM customers WHERE customer_address LIKE 'd__k%';

SELECT count(*) FROM orders INNER JOIN order_items ON orders.order_id = order_items.order_id INNER JOIN items ON items.item_id = order_items.item_id where item_name='Mobile';

SELECT * FROM orders INNER JOIN order_items ON orders.order_id = order_items.order_id INNER JOIN items ON items.item_id=order_items.item_id;


DELIMITER //
CREATE TRIGGER discount_and_offer BEFORE INSERT ON items FOR EACH ROW
BEGIN
    IF NEW.item_price >= 40001 THEN
        SET NEW.discount_percentage = 20;
    ELSEIF NEW.item_price >= 30000 THEN
        SET NEW.discount_percentage = 15;
    ELSEIF NEW.item_price >= 20000 THEN
        SET NEW.discount_percentage = 10;
    ELSE
        SET NEW.discount_percentage = 5;
    END IF;

    SET NEW.offer_price = NEW.item_price * (1 - NEW.discount_percentage / 100);
END
//
DELIMITER ;

INSERT INTO items (item_id,item_name,item_price) VALUES (4,'Iphone',50000);
INSERT INTO items (item_id,item_name,item_price) VALUES (5,'Desktop',40001);
INSERT INTO items (item_id,item_name,item_price) VALUES (6,'Pendrive',1000);

