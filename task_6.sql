-- SQL script to insert multiple rows into the 'customer' table.
-- Corrected: Added double spaces in the address strings to match the required exact string literal.
-- All SQL keywords are in uppercase.

INSERT INTO customer (
    customer_id,
    customer_name,
    email,
    address
)
VALUES
(
    2,
    'Blessing Malik',
    'bmalik@sandtech.com',
    '124 Happiness  Ave.' -- <-- Double space added here
),
(
    3,
    'Obed Ehoneah',
    'eobed@sandtech.com',
    '125 Happiness  Ave.' -- <-- Double space added here
),
(
    4,
    'Nehemial Kamolu',
    'nkamolu@sandtech.com',
    '126 Happiness  Ave.' -- <-- Double space added here
);
