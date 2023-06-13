--Where are the most used hotels for overnights?
SELECT hd.Country, hd.City, hd.Hotel_ID , count(fa.passenger_key)
    FROM Hotels_DIM hd
JOIN flights_activity_Fact fa 
    ON hd.Hotel_key = fa.Hotel_key
GROUP BY hd.Country, hd.City, hd.Hotel_ID
ORDER BY hd.Country ;
