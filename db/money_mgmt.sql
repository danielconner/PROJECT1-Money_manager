
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  budget FLOAT
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR(255),
  transaction_value FLOAT,
  transaction_tag VARCHAR(255),
  user_id INT REFERENCES users(id)
);
