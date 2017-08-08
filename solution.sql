-- CREATE TABLE syntax_practice (
--     user_id serial PRIMARY KEY,
--     username character varying(12),
--     city character varying(128),
--     transactions_completed integer,
--     transactions_attempted integer,
--     account_balance numeric(12,2)
-- );

-- INSERT INTO syntax_practice (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
-- ('cherise', 'minneapolis', 9, 9, 4000.00),
-- ('larry', 'minneapolis', 3, 4, 77.01),
-- ('dallas', 'new york', 6, 12, 0.99),
-- ('anthony', 'chicago', 0, 0, 0.00),
-- ('travis', 'miami', 1, 100, 500000.34),
-- ('davey', 'chicago', 9, 99, 98.04),
-- ('ora', 'phoenix', 88, 90, 3.33),
-- ('grace', 'miami', 7, 9100, 34.78),
-- ('hope', 'phoenix', 4, 10, 50.17);

-- 1. Get all users from chicago
SELECT * FROM syntax_practice WHERE city='chicago';

-- 2. Get all users with usernames that contain the letter 'a'
SELECT * FROM syntax_practice WHERE username ILIKE '%a%';

-- 3. The bank is giving a new customer bonus, update all records with an account balance of 0.00 and a transactions attempt of 0, give them a new account balance of 10
SELECT * FROM syntax_practice WHERE account_balance = '0.00'
AND transactions_attempted = '0';

UPDATE syntax_practice SET account_balance='10.00' WHERE account_balance = '0.00'
AND transactions_attempted = '0';

SELECT * FROM syntax_practice;

-- 4. SELECT all users that have attempted 9 or more transactions
SELECT * FROM syntax_practice WHERE transactions_attempted >= 9;

-- 5. GET the user name and account balance of the 3 users with the highest balance, sort highest to lowest.
SELECT username, account_balance FROM syntax_practice
ORDER BY account_balance DESC
LIMIT 3;

-- 6. GET the usernames and account balances of the usernames with the lowest balances, low to high
SELECT username, account_balance FROM syntax_practice
ORDER BY account_balance ASC
LIMIT 3;

-- 7. GET all users with account balances higher than 100$
SELECT * FROM syntax_practice
WHERE account_balance > '100.00';

-- 8. Add a new record
INSERT INTO syntax_practice (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('jawn', 'minnetonka', '32', '55', '700.00');

-- 9. THE bank is losing money in miami and phoenix and needs to unload low transaction customers, delete users that reside in miami and phoenix that have fewer than 5 transactions
DELETE FROM syntax_practice
WHERE (city = 'miami'
OR city = 'phoenix')
AND transactions_completed < 5;