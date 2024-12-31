DROP DATABASE IF EXISTS guitar_shop;
CREATE DATABASE guitar_shop;
USE guitar_shop;

-- Create table for guitar brands
CREATE TABLE guitarbrands (
    brand_id 	INT 	PRIMARY KEY,
    brandname 	VARCHAR(50) 	NOT NULL
);

CREATE TABLE category (
	category_id INT Primary KEY,
    guitar_type VARCHAR(255) NOT NULL
);

CREATE TABLE founder (
	owner_id INT PRIMARY KEY,
    owner_name VARCHAR(255) NOT NULL
    );

CREATE TABLE products (
    guitar_id INT PRIMARY KEY,
    model VARCHAR(255),
    year VARCHAR(10),
    price DECIMAL(10, 2),
    category_id INT,
    brand_id INT,
    owner_id INT,
  CONSTRAINT products_fk_category
    FOREIGN KEY (category_id)
    REFERENCES category (category_id),
  CONSTRAINT products_fk_guitarbrands
    FOREIGN KEY (brand_id)
    REFERENCES guitarbrands (brand_id),
  CONSTRAINT products_fk_founder
    FOREIGN KEY (owner_id)
    REFERENCES founder (owner_id)
);


Create TABLE in_stock (
	brand_id 	INT 	PRIMARY KEY,
	in_stockid		INT		NOT NULL,
    brandname 	VARCHAR(255) 	NOT NULL,
    Constraint in_stock_fk_guitarbrands
    FOREIGN KEY (brand_id)
   REFERENCES guitarbrands (brand_id)
   );
   

