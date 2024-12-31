SELECT model, price
FROM products
WHERE category_id = 1 
AND price < 400.00;

SELECT COUNT(*) AS total_count
FROM products p
INNER JOIN category c ON p.category_id = c.category_id
WHERE c.guitar_type = 'Electric'
AND p.price < 400.00;

SELECT gb.brandname AS guitar_brand, p.model
FROM products p
INNER JOIN guitarbrands gb ON p.brand_id = gb.brand_id;

SELECT f.owner_name AS owner_name, p.model AS model_name, gb.brandname AS guitar_brand, p.price
FROM products p
INNER JOIN founder f ON p.owner_id = f.owner_id
INNER JOIN guitarbrands gb ON p.brand_id = gb.brand_id
INNER JOIN category c ON p.category_id = c.category_id
WHERE c.guitar_type = 'Electric'
AND p.price < 700
AND f.owner_id = (
    SELECT owner_id
    FROM (
        SELECT p.owner_id, COUNT(*) AS electric_count
        FROM products p
        INNER JOIN category c ON p.category_id = c.category_id
        WHERE c.guitar_type = 'Electric'
        AND p.price < 700
        GROUP BY p.owner_id
        ORDER BY electric_count DESC
        LIMIT 1
    ) AS subquery
);


SELECT p.model AS guitar_model, p.price, i.in_stockid
FROM products p
INNER JOIN in_stock i ON p.brand_id = i.brand_id
WHERE p.price < 600.00;

UPDATE in_stock AS i
JOIN guitarbrands AS gb ON i.brand_id = gb.brand_id
JOIN products AS p ON p.brand_id = gb.brand_id
SET i.in_stockid = 0
WHERE p.model = 'Telecaster' AND gb.brandname = 'LyxPro';

SELECT f.owner_name, p.model, g.brandname, p.price, i.in_stockid
FROM products AS p
JOIN founder AS f ON p.owner_id = f.owner_id
JOIN guitarbrands AS g ON p.brand_id = g.brand_id
JOIN in_stock AS i ON p.brand_id = i.brand_id
WHERE p.model = 'Telecaster'
AND g.brandname = 'LyxPro';

