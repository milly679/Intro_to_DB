-- SQL script to create all necessary tables for the alx_book_store database.
-- Table names and column definitions are strictly based on cumulative test feedback.
-- All SQL keywords are in UPPERCASE.

-- 1. AUTHORS Table
CREATE TABLE Authors (
    author_id INT NOT NULL,
    author_name VARCHAR(215) NOT NULL,
    PRIMARY KEY (author_id)
);

-- 2. BOOKS Table
CREATE TABLE Books (
    book_id INT NOT NULL,
    title VARCHAR(215) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. CUSTOMERS Table
CREATE TABLE Customers (
    customer_id INT NOT NULL,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT,
    PRIMARY KEY (customer_id)
);

-- 4. ORDERS Table
CREATE TABLE Orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. ORDER_DETAILS Table (UPDATED to use "quantity DOUBLE")
CREATE TABLE Order_Details (
    order_detail_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    PRIMARY KEY (order_detail_id),
    UNIQUE KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
