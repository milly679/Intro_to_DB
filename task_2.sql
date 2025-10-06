-- SQL script to create all necessary tables for the alx_book_store database.
-- The database name is expected to be passed to the mysql command.
-- All SQL keywords are in uppercase.

-- 1. AUTHORS Table
-- Stores information about book authors.
CREATE TABLE authors (
    author_id INT NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (author_id)
);

-- 2. CUSTOMERS Table
-- Stores customer details.
CREATE TABLE customers (
    customer_id INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255),
    PRIMARY KEY (customer_id)
);

-- 3. BOOKS Table
-- Stores information about the books available. Depends on authors table.
CREATE TABLE books (
    book_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2),
    publication_date DATE,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- 4. ORDERS Table
-- Stores customer order details. Depends on customers table.
CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 5. ORDER DETAILS Table (Junction Table)
-- Links ORDERS and BOOKS tables, storing quantity. Uses a composite primary key.
CREATE TABLE `order details` (
    order_detail_id INT NOT NULL, -- Added a unique ID for simplicity, though PK is composite
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
