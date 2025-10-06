-- Step 1: Retrieve table structure information
-- Step 2: We are NOT allowed to use DESCRIBE or EXPLAIN
-- Step 3: Use INFORMATION_SCHEMA to get details about the 'books' table

SELECT 
    COLUMN_NAME,       -- Name of each column
    COLUMN_TYPE,       -- Data type (e.g. VARCHAR(100), INT)
    IS_NULLABLE,       -- Whether the column can have NULL values
    COLUMN_KEY,        -- Whether it's a PRIMARY or FOREIGN key
    COLUMN_DEFAULT,    -- Default value if any
    EXTRA              -- Extra info (e.g. auto_increment)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()   -- The current database passed in MySQL command
  AND TABLE_NAME = 'books';       -- The table we want to describe
