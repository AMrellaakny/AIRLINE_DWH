SELECT fa.Flight_key, fa.Segment_number, ac.Aircraft_key,  
           Round( (COUNT(fa.Passenger_key) / ac.Seats_Capacity)* 100,2) AS Capacity_Percentage
    FROM flights_activity_Fact fa
JOIN Aircrafts_Dim ac
    ON fa.Aircraft_key = ac.Aircraft_key
GROUP BY fa.Flight_key, fa.Segment_number, ac.Aircraft_key, ac.Seats_Capacity
ORDER BY Capacity_Percentage DESC ;
