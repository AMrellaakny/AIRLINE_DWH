DECLARE

    v_type VARCHAR(250);
    v_time VARCHAR(250);

    CURSOR Cur IS
       SELECT Interaction_key ,Problem_severity
        from Customer_Care_fact
        FOR UPDATE OF Problem_severity;



BEGIN

    FOR Rec IN Cur
    
    LOOP
    
        SELECT Interaction_time, TYPE
        INTO v_time, v_type
        FROM Interactions_DIM
        WHERE Interaction_key = Rec.INTERACTION_KEY;
    
        IF (v_time = 'Within Flight' AND v_type = 'Complaints')
        THEN
        
            UPDATE Customer_Care_fact
            SET Problem_severity = 6
            WHERE CURRENT OF Cur;
            
        ELSIF (v_time = 'Before Flight' AND v_type = 'Complaints')
        THEN
            UPDATE Customer_Care_fact
            SET Problem_severity = 2
            WHERE CURRENT OF Cur;
        
        ELSIF (v_time = 'After Flight' AND v_type = 'Complaints')
        THEN
            UPDATE Customer_Care_fact
            SET Problem_severity = 4
            WHERE CURRENT OF Cur;
          
        ELSIF (v_time = 'Within Flight' AND v_type = 'Inquire')
        THEN
            UPDATE Customer_Care_fact
            SET Problem_severity= 6
            WHERE CURRENT OF Cur;
            
        ELSIF (v_time = 'Within Flight' AND v_type = 'Feedback')
        THEN
            UPDATE Customer_Care_fact
            SET Feedback_Rate = TRUNC(dbms_random.value(1,5),0)
            WHERE CURRENT OF Cur;
            
        ELSIF (v_time = 'Before Flight' AND v_type = 'Inquire')
        THEN
            UPDATE Customer_Care_fact
            SET Problem_severity = 2
            WHERE CURRENT OF Cur;
            
        ELSIF (v_time = 'Before Flight' AND v_type = 'Feedback')
        THEN
            UPDATE Customer_Care_fact
            SET Feedback_Rate= TRUNC(dbms_random.value(1,5),0)
            WHERE CURRENT OF Cur;
        ELSIF (v_time = 'After Flight' AND v_type = 'Feedback')
        THEN
            UPDATE Customer_Care_fact
            SET Feedback_Rate = TRUNC(dbms_random.value(1,5),0)
            WHERE CURRENT OF Cur;
            
        ELSIF (v_time = 'After Flight' AND v_type = 'Inquire')
        THEN
            UPDATE Customer_Care_fact
            SET Problem_severity = 4
            WHERE CURRENT OF Cur;
           END IF;   
            
    END LOOP;                                       
END;
