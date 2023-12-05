# Database Implementation for a Car Rental Company

Problem: Smile, a car rental company, wants to develop a relational database to store and organize all of the data of its car rental system: comprehensive information on all aspects of the rental process, from the initial hire agreement to the vehicle return and fault report, as well as information on the company’s outlets, staff, and clients. The company also wants to equip the database to store additional information that may be relevant to the company, such as payment information following vehicle rental (the amount paid, the date payment was made, the method of transaction used), or the locations at which a vehicle is rented and returned.

## Data Requirements
### Outlet 
Smile has outlets (garages and offices). Each outlet is allocated members of staff, including a manager who manages the operations of the outlets. The data describing the outlet includes a unique number, address, phone number, and fax number. 

### Staff
Smile employs staff members. All staff members have a unique identification number. The data describing the staff members are first and last name, home address, home phone number, date of birth (DOB), sex, National Insurance Number (NIN), date joined the company, job title, salary, and current outlet number where staff works. The staff member can change the outlet and location, but only the current location is listed under the staff data.

### Vehicle
Smile has two types of vehicles, cars and vans. Each vehicle has a unique 6-character registration number which is used when renting a vehicle. The data stored on each vehicle are the model, make, engine size, capacity, the date MOT due, the daily hire rate, vehicle status (showing whether the vehicle is reserved, undergoing a fault check, or available for hire), the outlet number of the current outlet the vehicle is in, and reservation count.

### Fault Report 
A fault report is made to check the condition of the vehicle after the return of the vehicle. The fault report has a unique report number to keep track of the vehicle's status. The data stored on each fault report are the vehicle’s registration number, the staff number of the staff who supervises the fault report, the date the vehicle is checked, and whether the faults are found on the vehicle. 

### Hire Agreement 
The hire agreement is made with every renting of any vehicle by any client. Each hire agreement is uniquely identified with a hire number. The data stored on the hire agreement are the client number, start date, expected termination date, vehicle registration number, and staff number who administers the rental. 

### Receipts
All the money the company gets through rentals and fault checks is stored in the receipts table. Each receipt has a unique receipt number. The data stored for each receipt include the hire number associated with the receipt, fault report number if there are any faults found that need to be reimbursed, amount paid, date paid, and payment method.

### Mileage
The mileage of the vehicle is checked before and after the rental of the vehicle. Each mileage has a unique mileage registration number, as well as vehicle registration number, hire agreement number, mileage amount, and the date mileage amount is checked.

### Clients
Each client has a unique client number. The client number uniquely identifies each and all clients who have rented in the past and those currently renting. Clients can rent at least one vehicle for a minimum of 1 day and a maximum of 1 year. There are two types of clients, personal and business clients. The data stored in the clients table are first and last names for personal clients, or company name and business type for business clients, the address of the client, and phone number. 

### Business Clients
Each business client has a unique business registration number. The data stored on each business client are client number and fax number.

### Personal Clients
Each personal client is assigned a unique personal registration number within a company. The data stored for each client includes the client number, date of birth, and the client's driving license number.

Then we create a database by using a sequence of CREATE TABLE statements. Below is an example of such a statement for the outlet table.
```sql
-- Table structure for table `outlet`
DROP TABLE IF EXISTS `outlet`;
CREATE TABLE `outlet` (
  `outlet_number` int NOT NULL,
  `address` varchar(60) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `fax_number` int DEFAULT NULL,
  PRIMARY KEY (`outlet_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

The resulting database can be represented in the following data schema diagram generated via MySQL Workbench Enhanced Entity Diagram.
<p align="center">
  <imgsrc="images/EER_1.PNG">
</p>

![alt text](https://github.com/normatovbekzod/car-rental-sql-database/blob/main/images/EER_1.png)
