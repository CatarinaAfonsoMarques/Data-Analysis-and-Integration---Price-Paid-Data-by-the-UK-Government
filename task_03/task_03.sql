SELECT town_city AS city,
    transfer_date AS sale_date,
    SUM(price) AS total_amount
FROM price_paid_transactions
WHERE town_city IS NOT NULL
GROUP BY town_city, transfer_date
ORDER BY total_amount DESC;
