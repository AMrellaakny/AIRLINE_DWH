--What are the numbers of Feedbacks Ratings based on their degree of rate per year?
SELECT d.Year, i.TYPE, f.Feedback_Rate,
            COUNT(f.Feedback_Rate) AS "No. of Feedback Ratings", i.Description 
    FROM Interactions_DIM i 
JOIN Customer_Care_fact f
    ON i.Interaction_key = f.Interaction_key
JOIN Date_Dim d
    ON d.Full_date = f.Reservation_Ticket_Date
WHERE i.TYPE = 'Feedback'
GROUP BY d.Year, i.TYPE, f.Feedback_Rate, i.Description
ORDER BY COUNT(f.Feedback_Rate) DESC ;
