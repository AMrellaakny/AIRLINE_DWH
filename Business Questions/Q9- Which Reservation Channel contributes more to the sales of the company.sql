--Which Reservation Channel contributes more to the sales of the company?
SELECT ch.Channel_Type AS "Reservation Channel", SUM(fa.Net_price) AS Total_sales
    FROM flights_activity_Fact fa
JOIN Channels_Dim ch
    ON fa.Channel_key = ch.channel_key
GROUP BY ch.Channel_Type
ORDER BY Total_sales DESC;
