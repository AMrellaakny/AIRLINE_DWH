--What are the profits of the company per Quarter
SELECT d.Year, d.Quarter, SUM(fa.Profit) AS "Profit"
    FROM flights_activity_Fact fa
JOIN Date_Dim d
ON fa.Reservation_Ticket_Date = d.full_date
GROUP BY d.Year, d.Quarter ;
