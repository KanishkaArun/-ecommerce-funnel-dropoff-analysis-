SELECT 
    CASE 
        WHEN price < 5 THEN 'Under $5'
        WHEN price < 15 THEN '$5-15'
        WHEN price < 30 THEN '$15-30'
        ELSE 'Over $30'
    END AS price_band,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_session END) AS carted,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_session END) AS purchased
FROM events
WHERE event_type IN ('cart', 'purchase')
GROUP BY price_band
ORDER BY carted DESC;