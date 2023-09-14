## Preprocessing data
-- set default schema
USE bakery;

-- convert datetime column from text to datetime type
ALTER TABLE sales
MODIFY COLUMN date_time datetime;

-- replace all empty cells with null
UPDATE sales
SET place = null
WHERE place = '';

-- transform table
-- new columns are date_time, day_of_week, total, place, product
CREATE TABLE new_sales AS

	SELECT date_time, day_of_week, total, place, 'angbutter' AS product, angbutter AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'plain_bread)' AS product, plain_bread AS orders
	FROM sales
	UNION ALL 
	SELECT date_time, day_of_week, total, place, 'jam' AS product, jam AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'americano' AS product, americano AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'croissant' AS product, croissant AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'cafe_latte' AS product, cafe_latte AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'tiramisu_croissant' AS product, tiramisu_croissant AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'cacao_deep' AS product, cacao_deep AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'pain_au_chocolat' AS product, pain_au_chocolat AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'almond_croissant' AS product, almond_croissant AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'croque_monsieur' AS product, croque_monsieur AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'mad_garlic' AS product, mad_garlic AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'milk_tea' AS product, milk_tea AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'gateau_chocolat' AS product, gateau_chocolat AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'pandoro' AS product, pandoro AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'cheese_cake' AS product, cheese_cake AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'lemonade' AS product, lemonade AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'orange_pound' AS product, orange_pound AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'wiener' AS product, wiener AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'vanilla_latte' AS product, vanilla_latte AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'berryade' AS product, berryade AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'tiramisu' AS product, tiramisu AS orders
	FROM sales
	UNION ALL
	SELECT date_time, day_of_week, total, place, 'merinque_cookies' AS product, merinque_cookies AS orders
	FROM sales;

-- Understand the percentage of orders for each subcatetory
SELECT product, SUM(orders) AS total_sold, SUM(orders)/10840 * 100 AS perct_sold
FROM new_sales
GROUP BY product
ORDER BY total_sold DESC;
