-- Execute three different types of INSERT commands to insert tuples into one of your relations.
-- Let us insert tuples into our "fault_report" relation

USE smile;
-- Fault report for hire agreements of vehicle 'RRUW6S' with fault status simulated as a randomly assigned value faulty or not faulty
INSERT INTO fault_report
(SELECT ((SELECT report_number FROM fault_report ORDER BY report_number DESC LIMIT 1) + 1), vehicle_registration_number, 
	staff_number, hire_number, termination_date, ROUND(RAND())
FROM hire_agreement 
WHERE vehicle_registration_number = 'RRUW6S');

-- Response of MySQL editor: 1 row(s) affected Records: 1  Duplicates: 0  Warnings: 0

-- Fault report for hire agreements of vehicle 'VZFZGN' overseen by staff with staff number 68, limited to a maximum of 3 entries
INSERT INTO fault_report
(SELECT ((SELECT report_number FROM fault_report ORDER BY report_number DESC LIMIT 1) + 1), vehicle_registration_number, 
	staff_number, hire_number, termination_date, ROUND(RAND())
FROM hire_agreement 
WHERE vehicle_registration_number = 'VZFZGN' AND staff_number = '68'
LIMIT 3);

-- Response of MySQL editor: 1 row(s) affected Records: 1  Duplicates: 0  Warnings: 0

-- Fault report for hire agreements of vehicle 'K9XYEY' with odd hire number
INSERT INTO fault_report
(SELECT ((SELECT report_number FROM fault_report ORDER BY report_number DESC LIMIT 1) + 1), vehicle_registration_number, 
	staff_number, hire_number, termination_date, ROUND(RAND())
FROM hire_agreement WHERE vehicle_registration_number = 'K9XYEY' AND MOD(hire_number, 2) = 1);

-- Response of MySQL editor: 1 row(s) affected Records: 1  Duplicates: 0  Warnings: 0

-- Here are other possible insert statements
-- INSERT INTO fault_report
-- VALUES ( 501 + 1,
-- 	(SELECT vehicle_registration_number FROM hire_agreement WHERE vehicle_registration_number = 'VZFZGN'),
--     (SELECT staff_number FROM hire_agreement WHERE vehicle_registration_number = 'VZFZGN'),
--     (SELECT hire_number FROM hire_agreement WHERE vehicle_registration_number = 'VZFZGN'),
--     (SELECT termination_date FROM hire_agreement WHERE vehicle_registration_number = 'VZFZGN') + 1, 
--     0);
--     
-- INSERT INTO fault_report
-- VALUES ( 502 + 1,
-- 	(SELECT vehicle_registration_number FROM hire_agreement WHERE vehicle_registration_number = 'K9XYEY'),
--     (SELECT staff_number FROM hire_agreement WHERE vehicle_registration_number = 'K9XYEY'),
--     (SELECT hire_number FROM hire_agreement WHERE vehicle_registration_number = 'K9XYEY'),
--     (SELECT termination_date FROM hire_agreement WHERE vehicle_registration_number = 'K9XYEY') + 1, 
--     0);
    
-- INSERT INTO vehicle VALUES ('1438W2','Corolla','Toyota',2,5,'2023-01-30',1535,'Car',66,'Unavailable',8);
-- INSERT INTO vehicle VALUES ('0122X0','Cayenne Coupe','Hyundai',2,5,'2023-01-30',1535,'Van',66,'Available',9);
