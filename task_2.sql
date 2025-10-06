-- SQL script to create all necessary tables for the alx_book_store database.
-- Table names and SQL keywords are strictly capitalized to match testing requirements.
-- The database name is expected to be passed as an argument to the mysql command.

-- 1. AUTHORS Table
CREATE TABLE Authors (
    author_id INT NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (author_id)
);

-- 2. CUSTOMERS Table
CREATE TABLE Customers (
    customer_id INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255),
    PRIMARY KEY (customer_id)
);

-- 3. BOOKS Table
CREATE TABLE Books (
    book_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    PRIMARY KEY (book_id),
    -- Link to the Authors table
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 4. ORDERS Table
CREATE TABLE Orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (order_id),
    -- Link to the Customers table
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. ORDER_DETAILS Table (uses underscore to match common check requirements)
CREATE TABLE Order_Details (
    order_detail_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_detail_id),
    -- Enforce uniqueness for each book in an order
    UNIQUE KEY (order_id, book_id),
    -- Link to the Orders table
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    -- Link to the Books table
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
