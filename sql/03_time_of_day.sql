SELECT 
    CAST(strftime('%H', event_time) AS INTEGER) AS hour_of_day,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_session END) AS carted,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_session END) AS purchased
FROM events
WHERE event_type IN ('cart', 'purchase')
GROUP BY hour_of_day
ORDER BY hour_of_day;