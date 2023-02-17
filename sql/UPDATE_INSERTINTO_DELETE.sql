-- UPDATE

SELECT v.vehicle_registration_number, v.status 
						FROM smile.vehicle v, smile.fault_report f 
						WHERE v.vehicle_registration_number = f.vehicle_registration_number 
							AND v.status = 'Available' 
							AND f.isFaulty = 1
							AND f.date_checked >= '2018-01-01';
                            
UPDATE smile.vehicle v 
SET status = 'Unavailable' 
WHERE EXISTS (SELECT * 
				FROM (SELECT v.vehicle_registration_number, v.status 
						FROM smile.vehicle v, smile.fault_report f 
						WHERE v.vehicle_registration_number = f.vehicle_registration_number 
							AND v.status = 'Available' 
							AND f.isFaulty = 1
							AND f.date_checked >= '2018-01-01') AS unav_cars 
				WHERE v.vehicle_registration_number = unav_cars.vehicle_registration_number);

-- INSERT

SELECT vehicle_registration_number 
FROM smile.vehicle 
WHERE capacity >= 5 
	AND make = 'Toyota' 
	AND daily_hire_rate BETWEEN 500 AND 700 
	AND type = 'Car' 
	AND status = 'Available';
    
INSERT INTO smile.hire_agreement 
VALUES (601, 327, '2023-02-15', '2023-04-15', 'NLP2E2', 23);

-- 1 row(s) affected

-- DELETE 

SELECT * FROM smile.vehicle WHERE daily_hire_rate <210 AND type = 'Van';

DELETE FROM smile.vehicle v WHERE 
EXISTS (SELECT * 
		FROM (SELECT * FROM smile.vehicle WHERE daily_hire_rate <210 AND type = 'Van') AS van 
        WHERE van.vehicle_registration_number = v.vehicle_registration_number);
        
-- 1 row(s) affected