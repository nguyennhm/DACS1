CREATE DATABASE DACS1;
USE DACS1;

-- Tạo bảng đăng nhập
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Tạo bảng sản phẩm
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    total_value DECIMAL(10, 2) NOT NULL,
    entry_date DATE NOT NULL,
    total_sold INT NOT NULL DEFAULT 0,
    quan BLOB
);

-- Tạo bảng hóa đơn
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE NOT NULL
);

CREATE TABLE invoice_details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT NOT NULL,
    product_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price INT NOT NULL,
    total_price INT NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


DROP TABLE invoices_detail;
DROP TABLE invoices;

ALTER TABLE products ADD COLUMN total_sold INT DEFAULT 0;


ALTER TABLE products
ADD COLUMN unit_sold INT NOT NULL DEFAULT 0;

ALTER TABLE products
MODIFY total_value int;

ALTER TABLE products
MODIFY unit_price int;

ALTER TABLE invoices
MODIFY unit_price int;

ALTER TABLE invoices
MODIFY total_price int;

ALTER TABLE products
DROP COLUMN total_sold;

ALTER TABLE invoices MODIFY invoice_id INT;

SHOW CREATE TABLE invoices;

