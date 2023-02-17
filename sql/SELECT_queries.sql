SELECT COUNT(*) AS ReservedCount, AVG(daily_hire_rate) AS AverageHireRate
FROM smile.vehicle
WHERE status = 'Reserved';

-- Response: 1 row(s) returned

SELECT vehicle_registration_number, reserved_count, status, daily_hire_rate
FROM smile.vehicle 
WHERE daily_hire_rate < ALL (SELECT daily_hire_rate 
							FROM smile.vehicle 
							WHERE reserved_count <=2 AND status = "Available") 
ORDER BY daily_hire_rate DESC;

-- Response: 33 row(s) returned

SELECT vehicle_registration_number, capacity, status, daily_hire_rate
FROM smile.vehicle 
WHERE daily_hire_rate <210 ORDER BY daily_hire_rate DESC;

-- 3 row(s) returned

SELECT COUNT(DISTINCT vehicle_registration_number) 
FROM smile.fault_report
WHERE isFaulty = 'Yes' AND date_checked BETWEEN '2017-03-01' AND '2017-03-31';

-- 1 row(s) returned

SELECT mileage, status
FROM smile.mileage 
JOIN smile.vehicle ON vehicle.vehicle_registration_number = smile.mileage.vehicle_registration_number
WHERE vehicle.vehicle_registration_number = 'YOJB7P';

-- 1 row(s) returned

SELECT vehicle_registration_number, MAX(amount_paid)
FROM smile.hire_agreement 
RIGHT JOIN receipts ON receipts.hire_number = hire_agreement.hire_number
GROUP BY hire_agreement.hire_number HAVING COUNT(hire_agreement.hire_number) > 2;
 
-- 3 row(s) returned

SELECT vehicle_registration_number 
FROM smile.vehicle 
WHERE capacity >= 3 
	AND make = 'Toyota' 
	AND daily_hire_rate BETWEEN 200 AND 1000 
	AND type = 'Car' 
	AND status = 'Available';
    
-- 5 row(s) returned