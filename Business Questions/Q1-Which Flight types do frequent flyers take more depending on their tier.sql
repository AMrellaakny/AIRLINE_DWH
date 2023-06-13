--Which Flight types do frequent flyers take more depending on their tier?
SELECT fd.Flight_type, ff.Tier, COUNT(fa.Freq_key)  AS Frequent_Flyers_number
    FROM flights_activity_Fact fa 
JOIN Flights_DIM fd
    ON fa.Flight_key = fd.Flight_key 
JOIN Frequent_flyers_Dim ff
    ON ff.Freq_key = fa.Freq_key 
GROUP BY fd.Flight_type, ff.Tier ;
