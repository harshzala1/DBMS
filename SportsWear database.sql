--Extra Query on sportswear database
--here table schma is not created that's why error is there
--1. List the customers whose favorite color is Red or Green, and whose name is Jay or Dhruv.
SELECT 
	c.first_name, 
	c.last_name 
FROM customer c
JOIN color col
ON c.favorite_color_id = col.id
WHERE col.name IN ('Red', 'Green')
AND c.first_name IN ('Jay', 'Dhruv');

--2. List the different types of Joggers with their sizes.
SELECT 
	ci.name,
	ci.size
FROM clothing ci
WHERE ci.name = 'Joggers';

--3. List the order details of a T-shirt after 1st April 2024.
SELECT 
	co.* 
FROM clothing_order co
JOIN clothing ci 
ON co.clothing_id = ci.id
WHERE ci.name = 'T-shirt' 
AND co.order_date > '2024-04-01';


--4. List the customer whose favorite color is charged extra.
SELECT 
	c.first_name,
	c.last_name 
FROM customer c
JOIN color col 
ON c.favorite_color = col.id
WHERE col.extra_fee > 0;

--5. List the item name, minimum price, maximum price, average price, and number of clothing items.
SELECT ci.name, 
       MIN(ci.price) AS min_price, 
       MAX(ci.price) AS max_price, 
       AVG(ci.price) AS avg_price, 
       COUNT(ci.id) AS item_count 
FROM clothing ci
GROUP BY ci.name;

--6. List the customers with no purchases at all.
SELECT 
	c.first_name,
	c.last_name 
FROM customer c
LEFT JOIN clothing_order co
ON c.id = co.customer_id
WHERE co.id IS NULL;

--7. List the orders of favorite color with all details.
SELECT 
	c.first_name,
	c.last_name, co.*
FROM customer c
JOIN clothing_order co 
ON c.id = co.customer_id
JOIN color col 
ON c.favorite_color = col.id
WHERE col.id = co.color_id;

--8List the Customer with Total Purchase Value, and the number of orders and number of items purchased.
SELECT 
	   c.first_name, 
	   c.last_name, 
       SUM(ci.price * co.quantity) AS total_purchase_value, 
       COUNT(co.id) AS number_of_orders, 
       SUM(co.quantity) AS total_items_purchased
FROM customer c
JOIN clothing_order co ON c.id = co.customer_id
JOIN clothing ci ON co.clothing_item = ci.id
GROUP BY c.id, c.first_name, c.last_name;


--9. List the Clothing Item, Size, Order Value, and Number of Items sold during the financial year 2024-25.
SELECT 
	   ci.name, 
	   ci.size, 
       SUM(co.quantity * ci.price) AS order_value, 
       SUM(co.quantity) AS total_items_sold
FROM clothing_order co
JOIN clothing ci 
ON co.clothing_item = ci.id
WHERE co.order_date BETWEEN '2024-04-01' AND '2025-03-31'
GROUP BY ci.name, ci.size;

--10. List the customers who wear XL size.
SELECT 
	DISTINCT c.first_name, 
	c.last_name
FROM customer c
JOIN clothing_order co
ON c.id = co.customer_id
JOIN clothing_item ci
ON co.clothing_item = ci.id
WHERE ci.size = 'XL';