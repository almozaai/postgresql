DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
  id UUID PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE products(
  id UUID PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  in_stock BOOLEAN DEFAULT true,
  category_id UUID REFERENCES categories(id)
);

--896a9a1f-1e58-4027-abe6-6691a124277a
--c5df34aa-1b73-4759-aeae-688f9986a3b8
--b496f7ea-9997-4a28-a69e-2a6f9db0855b

--995486e3-abd8-4729-a9d3-64f781ad180d
--53b6da07-4498-446e-a44b-338d68105a3d
--dece5744-84f6-4ed0-a0da-752cb31bc933

INSERT INTO categories(id, name) VALUES('896a9a1f-1e58-4027-abe6-6691a124277a','foo category');
INSERT INTO categories(id, name) VALUES('c5df34aa-1b73-4759-aeae-688f9986a3b8','bar category');

INSERT INTO products(id, name, category_id) VALUES('995486e3-abd8-4729-a9d3-64f781ad180d','foo 1', '896a9a1f-1e58-4027-abe6-6691a124277a');
INSERT INTO products(id, name, category_id) VALUES('53b6da07-4498-446e-a44b-338d68105a3d','foo 2', '896a9a1f-1e58-4027-abe6-6691a124277a');
INSERT INTO products(id, name, in_stock, category_id) VALUES('dece5744-84f6-4ed0-a0da-752cb31bc933','bar1', false, 'c5df34aa-1b73-4759-aeae-688f9986a3b8');

SELECT products.name as product_name, categories.name as category_name
FROM products
JOIN categories
ON products.category_id = categories.id
