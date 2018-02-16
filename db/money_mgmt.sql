DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_name VARCHAR(255),
  bugdet FLOAT
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR(255),
  transaction_value FLOAT,
  transaction_tag VARCHAR(255),
  user_id INT REFERENCES users(id) ON DELETE CASCADE
);
