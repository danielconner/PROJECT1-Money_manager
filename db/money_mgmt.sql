
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  budget FLOAT
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR(255),
  transaction_value FLOAT,
  tag_id INT REFERENCES tags(id)
);
