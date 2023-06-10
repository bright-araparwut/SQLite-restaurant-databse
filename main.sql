.open restaurant.db

.table

.mode column

-- Subquery
-- Find the average price of menu items that use 'Tomatoes' as an ingredient.
SELECT AVG(price) as avg_tomato_price
FROM Menu 
WHERE menu_id IN (
  SELECT menu_id
  FROM Menu_Ingredients
  WHERE ingredient_id  = (select ingredient_id from Ingredient where ingredient_name = 'Tomatoes')
);

-- Common Table Expression (CTE):
-- List the total quantity of each menu item sold.
WITH MenuQuantity AS (
  SELECT menu_id, SUM(quantity) as total_quantity
  FROM Transactions
  GROUP BY menu_id
)

select m.dish_name, mq.total_quantity
from MenuQuantity mq
join Menu m ON m.menu_id = mq.menu_id

--Join
--Get a list of customers along with the dishes they've ordered.
select c.first_name, c.last_name, m.dish_name
from Customer c
join transactions t ON c.customer_id = t.customer_id
join Menu m ON t.menu_id = m.menu_id

Aggregate Function
Calculate the total revenue from all transactions.
select SUM(t.quantity * m.price) as total_revenue
FROM transactions t
join Menu m ON t.menu_id = m.menu_id

-- Advanced:
-- Use a combination of subqueries, CTEs, joins, and aggregate functions to find the customer who has spent the most.
WITH CustomerSpending AS (
    SELECT t.customer_id, SUM(m.price * t.quantity) as total_spent
    FROM Transactions t
    JOIN Menu m ON t.menu_id = m.menu_id
    GROUP BY t.customer_id
)
SELECT c.first_name, c.last_name, cs.total_spent
FROM CustomerSpending cs
JOIN Customer c ON cs.customer_id = c.customer_id
WHERE cs.total_spent = (
    SELECT MAX(total_spent)
    FROM CustomerSpending
);
