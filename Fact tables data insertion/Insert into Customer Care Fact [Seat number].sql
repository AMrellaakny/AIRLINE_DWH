DECLARE

    CURSOR Cur IS
       SELECT Flight_key ,Seat_Number
        from Customer_Care_fact
        FOR UPDATE OF Seat_Number;

BEGIN

    FOR Rec IN Cur
    
    LOOP
    
        IF (Rec.Flight_key in (1,2,3,4,5,6))
        THEN
        
            UPDATE Customer_Care_fact
            SET Seat_Number = TRUNC(dbms_random.value(1,300),0)
            WHERE CURRENT OF Cur;
            
        END IF;

    END LOOP;
     
END;
