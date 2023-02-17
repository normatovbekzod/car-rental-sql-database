USE smile;
-- Create three views on top of your database schema. Hand in your CREATE VIEW statements and the response of the system.

-- A manager should see most of the information on any staff, excluding their national insurance number which is sensitive information.
CREATE OR REPLACE VIEW ManagerStaffView 
AS 
SELECT staff_number, first_name, last_name, home_address, home_phone_number, date_of_birth, sex, date_joined, job_title, salary, outlet_number
FROM staff
ORDER BY job_title, last_name, first_name;

-- Any staff member should have access to the hire agreements, receipts, and information of every client so that any staff member should be able to assist any client.
-- Let us use the example of an arbitrary staff member called Myranda Papierz.
-- Since this view is fairly expensive to execute, we could use a materialised view that update every 24 hours. 
-- However, in MySQL, there is no single command we can run to get a materialized view. 
-- We would have to create a table for the materialised view and create a procedure that refreshes it.
CREATE OR REPLACE VIEW PapierzHireAgreementView 
AS
SELECT *
FROM hire_agreement 
NATURAL JOIN clients
NATURAL JOIN receipts
ORDER BY amount_paid DESC;

-- Staff should view the catalogue of vehicles sorted according to popularity and mileage. The view should be grouped according to vehicle type.
CREATE OR REPLACE VIEW PopularVehiclesView 
AS
SELECT type, model, make, reserved_count
FROM vehicle
GROUP BY reserved_count, type, model, make
ORDER BY reserved_count DESC;

-- Response of MySQL Editor
-- Action: CREATE OR REPLACE VIEW ManagerStaffView 
-- Response: 0 row(s) affected
-- Action: CREATE OR REPLACE VIEW PapierzHireAgreementView 
-- Response: 0 row(s) affected
-- Action: CREATE OR REPLACE VIEW PopularVehiclesView 
-- Response: 0 row(s) affected

-- Show a query involving each view and the system response
SELECT * FROM ManagerStaffView LIMIT 5;
SELECT * FROM PapierzHireAgreementView LIMIT 5;
SELECT * FROM PopularVehiclesView LIMIT 5;

-- Response of MySQL Editor
-- Action: SELECT * FROM ManagerStaffView LIMIT 5
-- Response: 5 row(s) returned
-- Action: SELECT * FROM PapierzHireAgreementView LIMIT 5
-- Response: 5 row(s) returned
-- Action: SELECT * FROM PopularVehiclesView LIMIT 5
-- Response: 5 row(s) returned

-- Show a script of what happens when you try to modify your view, say by inserting a new tuple into it.
-- Let us try to add to ManagerStaffView
INSERT INTO ManagerStaffView VALUES ((SELECT staff_number FROM staff ORDER BY staff_number DESC LIMIT 1) + 1,'Jane','Doee','Abbey Drive, G14 9JP','41704005458','1964-07-26','Female','2012-03-19','Sales Associate',9121.86,3);
-- System response: 
-- 12:33:08	INSERT INTO ManagerStaffView VALUES ((SELECT staff_number FROM staff ORDER BY staff_number DESC LIMIT 1) + 1,'Jane','Doee','Abbey Drive, G14 9JP','41704005458','1964-07-26','Female','2012-03-19','Sales Associate',9121.86,3)	Error Code: 1443. The definition of table 'ManagerStaffView' prevents operation INSERT on table 'ManagerStaffView'.	0.00085 sec
-- Our view is updatable because it is a selection on one base table (staff). 
-- However, the view is not insertable because it dfoes not contain all columns in the base table that do not have a default value, i.e. national insurance number.
-- For more information, see https://dev.mysql.com/doc/refman/8.0/en/view-updatability.html 