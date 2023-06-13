DECLARE

    CURSOR Cur IS
       SELECT *
        from Flights_activity_fact;
       
       random_interval_timdep INTERVAL DAY(3) TO SECOND(3);            random_interval_timarriv INTERVAL DAY(3) TO SECOND(3);

BEGIN

    FOR Rec IN Cur
    
    LOOP

            random_interval_timdep :=  DBMS_RANDOM.VALUE(0, 100) * INTERVAL '1' SECOND;
            random_interval_timarriv := DBMS_RANDOM.VALUE(0, 100) * INTERVAL '1' SECOND;

            
            UPDATE Flights_activity_fact
            SET
                              
        --Adding Random Values for dates >> ( Actual ) for (Departure and Arrival)        
                     Actual_departure_date = Rec.Reservation_Ticket_Date + ROUND(DBMS_RANDOM.VALUE(1, 10)),

                     Actual_arrival_date = Rec.Reservation_Ticket_Date + ROUND(DBMS_RANDOM.VALUE(1, 10)),

        --Adding Random Values for time ( Schedualed and Actual ) for (Departure and Arrival)
                     Schedualed_departure_time =  Rec.Actual_departure_date + INTERVAL '1' SECOND * ABS(DBMS_RANDOM.VALUE(1, 10)),
                     Actual_departure_time = Rec.Schedualed_departure_time + random_interval_timdep, 
                     Schedualed_arrival_time =  Rec.Actual_departure_date + INTERVAL '1' SECOND * ABS(DBMS_RANDOM.VALUE(1, 10)),
                     Actual_arrival_time = Rec.Schedualed_arrival_time + random_interval_timarriv, 
                  
           --Adding Random Values for FK's of the dimension tables of the model that exists in this fact table (Channel_key / Payment_method_key / Fare_basis_key / Class_upgrade_key / Hotel_key )
                    
                    Channel_key = TRUNC(dbms_random.value(1,2),0),
                    Payment_method_key = TRUNC(dbms_random.value(1,2),0),
                    Fare_basis_key = TRUNC(dbms_random.value(1,6),0),
                    Class_upgrade_key = TRUNC(dbms_random.value(1,16),0),
                    Hotel_key = TRUNC(dbms_random.value(1,100),0),
                    
             --Adding Random Values for measures in this fact table (Luggage_number / Flight_duration / Base_fare_price / Taxes / Overweight_Luggage_price / Upgrade_fees / Transaction_fees / Cost )       
                    Luggage_number = TRUNC(dbms_random.value(0,5),0),
                    Flight_duration =  TRUNC(dbms_random.value(2,5),2),  
                    Base_fare_price = TRUNC(dbms_random.value(10,20),2),
                    Taxes = TRUNC(dbms_random.value(10,20),2),
                    Overweight_Luggage_price = TRUNC(dbms_random.value(10,50),2),
                    UPGRAGE_FEES = TRUNC(dbms_random.value(10,20),2),
                    Transaction_fees = TRUNC(dbms_random.value(10,20),2),
                    Cost = TRUNC(dbms_random.value(80,150),2)
                                        
            WHERE leg_key = Rec.leg_key;
              
            
        ---Adding Random values for overnight_stays in case of there is a stop stations or not ( If there were then overnight_stays = 0 )  
     If Rec.Flight_key in (1,4) Then
        Update Flights_activity_fact
            set overnight_stays = 0
         Where leg_key = Rec.leg_key ; 
    Else
                Update Flights_activity_fact
            set overnight_stays = TRUNC(dbms_random.value(1,2),0)
         Where leg_key = Rec.leg_key ;          
    End if;

        ---Adding Random values for promotion_amount in case of there is a promotion or not 
     If (Rec.Fare_basis_key in (1,3,5)) Then
        Update Flights_activity_fact
            set promotion_amount = 99
         Where leg_key = Rec.leg_key ; 
   Else
                Update Flights_activity_fact
            set promotion_amount = Round(dbms_random.value(0.1,0.5),2)
         Where leg_key = Rec.leg_key ;       
    End if ;

    END LOOP;
     
END;
