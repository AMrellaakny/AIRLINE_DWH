--What is the average number of nights passengers stay in each hotel?
SELECT h.Hotel_ID, h.Stars, TRUNC(AVG(fa.overnight_stays),0) AVG_number_of_nights
    FROM Hotels_DIM h 
JOIN flights_activity_Fact fa 
ON fa.Hotel_key = h.Hotel_key
GROUP BY h.Hotel_ID, h.Stars
ORDER BY AVG_number_of_nights DESC;
