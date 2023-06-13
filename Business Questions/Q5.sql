SELECT d.Year, i.TYPE, i.Interaction_time, f.Problem_severity,
            COUNT (f.Problem_Severity) AS "No. of Complaints", i.Description 
    FROM Interactions_DIM i 
JOIN Customer_Care_fact f
    ON i.Interaction_key = f.Interaction_key
JOIN Date_Dim d
    ON d.Full_date = f.Reservation_Ticket_Date
WHERE i.TYPE = 'Complaints'
GROUP BY d.YEAR,  i.TYPE, i.Interaction_time, f.Problem_severity, i.Description ;    
