--Find the interaction type for inquiries and complaints and the employee who worked on it
SELECT i.TYPE, i.Interaction_time, f.Problem_severity, st.NAME AS Customer_Services_name
    FROM Interactions_DIM i 
JOIN Customer_Care_fact f
    ON i.Interaction_key = f.Interaction_key
JOIN Staff_Dim st
    ON f.Staff_key = st.Staff_key
WHERE i.TYPE = 'Complaints' OR i.Type = 'Inquire' 
ORDER BY i.TYPE;
