/* Find the sales in terms of total dollars for all orders in each year, ordered from greatest
to least. Do you notice any trends in the yearly sales totals? */
SELECT DATE_PART('year', occurred_at) AS year, SUM(total_amt_usd) AS total_sales
FROM orders
GROUP BY year
ORDER BY total_sales DESC;

/* Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all
months evenly represented by the dataset? */
SELECT DATE_PART('month', occurred_at) AS month, SUM(total_amt_usd) AS total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month
ORDER BY total_sales DESC;

/* Which year did Parch & Posey have the greatest sales in terms of total number of orders?
Are all years evenly represented by the dataset? */
SELECT DATE_PART('year', occurred_at) AS year, COUNT(id) AS order_count
FROM orders
GROUP BY year
ORDER BY order_count DESC;

/* Which month did Parch & Posey have the greatest sales in terms of total number of orders?
Are all months evenly represented by the dataset? */
SELECT DATE_PART('month', occurred_at) AS month, COUNT(id) AS order_count
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month
ORDER BY order_count DESC;

-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
SELECT DATE_TRUNC('month', o.occurred_at) AS month, a.name AS account,
       SUM(o.gloss_amt_usd) AS gloss_sales
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id AND a.name = 'Walmart'
GROUP BY month, account
ORDER BY gloss_sales DESC
LIMIT 1;
