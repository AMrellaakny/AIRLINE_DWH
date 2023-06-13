DECLARE
    CURSOR Cur IS
       SELECT Leg_key, Net_price, Base_fare_price, Taxes, Overweight_Luggage_price, Upgrage_fees, Transaction_fees, Promotion_amount, Cost, Profit
        from Flights_activity_fact
        FOR UPDATE OF Net_price ;

BEGIN

    FOR Rec IN Cur
    
    Loop
        
        UPDATE Flights_activity_fact
        SET Net_price = (Base_fare_price+ Taxes+nvl(Overweight_Luggage_price,0)+nvl(Upgrage_fees,0)+Transaction_fees)-nvl(Promotion_amount ,0)
        WHERE CURRENT OF Cur;
        UPDATE Flights_activity_fact
        SET Profit =Net_price-Cost
        WHERE CURRENT OF Cur;
      

    END LOOP;

END;
