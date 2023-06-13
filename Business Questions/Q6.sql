SELECT d.Year, i.TYPE, MAX(f.Problem_Severity)
    FROM  Interactions_DIM i  
JOIN Customer_Care_fact f
   ON i.Interaction_key = f.Interaction_key
JOIN Date_Dim d
    ON d.Full_date = f.Reservation_Ticket_Date
WHERE i.TYPE = 'Complaints'
GROUP BY d.Year, i.TYPE ;
