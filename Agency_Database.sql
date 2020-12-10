Drop Database IF EXISTS Estate_Agency;

CREATE DATABASE Estate_Agency;
USE Estate_Agency;

	CREATE TABLE IF NOT EXISTS Branch
	(
	  Branch_ID INT NOT NULL AUTO_INCREMENT,
	  Name CHAR(255) NOT NULL,
	  Phone_No INT  NOT NULL,
	  Street CHAR(255),
	  Town CHAR(255),
	  County CHAR(255),
	  PRIMARY KEY (Branch_ID),
	  CONSTRAINT check_Phone_No CHECK ( Phone_No < 10000000000 )
	);


	Insert Into Branch Values(001, 'Casa Hunt South', 894111873, 'Honeypark', 'Dun Laoghaire', 'Dublin');
	Insert Into Branch Values(002, 'Casa Hunt North', 0894865585, 'Sword Centre', 'Sword', 'Dublin 9');
	Insert Into Branch Values(003, 'Casa Hunt Citywest', 864222345, 'Naas Rd', 'Naas', 'Wicklow');


/* SELECT * FROM BRANCH; */

	CREATE TABLE IF NOT EXISTS Employee
	(
	  Employee_ID INT NOT NULL AUTO_INCREMENT,
	  FName VARCHAR(20) NOT NULL,
	  SName VARCHAR(20) NOT NULL,
	  Emp_Position VARCHAR(20) NOT NULL,
	  Emp_Status VARCHAR(20) NOT NULL,
	  Salary INT NOT NULL,
	  PPS VARCHAR(9) UNIQUE NOT NULL,
	  Branch_ID INT NOT NULL,
	  PRIMARY KEY (Employee_ID),
	  FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID),
	  CONSTRAINT check_PPS CHECK(CHARACTER_LENGTH(PPS) = 9 AND SUBSTRING(PPS FROM 1 FOR 1) BETWEEN 'A' AND 'Z'),
	  CONSTRAINT check_Position CHECK(Emp_Position = 'Manager' OR Emp_Position = 'Executive'),
	  CONSTRAINT check_Status CHECK(Emp_Status IN ('Active','Inactive'))
      -- CONSTRAINT check_Status CHECK(Emp_Status = 'Active' OR Emp_Status = 'Inactive')
	);
	INSERT INTO Employee VALUES( 0001, 'Harry', 'Potter', 'Executive', 'Active', 3000, 'A23456789', 001); 
	INSERT INTO Employee VALUES( 0002, 'Ron', 'Weasley', 'Executive', 'Active', 2800, 'OA3456789', 002); 
	INSERT INTO Employee VALUES( 0003, 'Hermoine', 'Granger', 'Manager', 'Active', 4000, 'SB9876543', 002); 
	INSERT INTO Employee VALUES( 0004, 'Percy', 'Jackson', 'Manager', 'Active', 4000, 'A24654323', 003); 
	INSERT INTO Employee VALUES( 0005, 'Emma', 'Corrin', 'Executive', 'Active', 3000, 'F22446688', 001); 
	INSERT INTO Employee VALUES( 0006, 'William', 'Smith', 'Executive', 'Active', 2800, 'OA1232412', 002); 
	INSERT INTO Employee VALUES( 0007, 'Tom', 'Shelby', 'Executive', 'Active', 3000, 'S19376543', 001); 
	INSERT INTO Employee VALUES( 0008, 'Sherlock', 'Holmes', 'Executive', 'Active', 3200, 'K24651323', 003); 
	INSERT INTO Employee VALUES( 0009, 'Willy', 'Wonka', 'Manager', 'Active', 4200, 'A23451129', 001); 

/* SELECT * FROM Employee; */

	CREATE TABLE IF NOT EXISTS Owner
	(
	  Owner_ID INT NOT NULL auto_increment,
	  FName VARCHAR(20) NOT NULL,
	  SName VARCHAR(20) NOT NULL,
	  Phone_No INT  NOT NULL,
      Email varchar(50),
	  PRIMARY KEY (Owner_ID),
	  CONSTRAINT check_Phone CHECK ( Phone_No < 10000000000 ),
      CONSTRAINT check_Email CHECK ( Email  LIKE '%_@__%.__%' )
	);


	INSERT INTO Owner VALUES( 001, 'Jude', 'Law', '862345678',NULL);
	INSERT INTO Owner VALUES( 002, 'Zach', 'Jones', '862345679','zachj@gmail.com');
	INSERT INTO Owner VALUES( 003, 'Cody', 'Jones', '862345680',NULL);
	INSERT INTO Owner VALUES( 004, 'Rick', 'Lax', '862345681',NULL);
	INSERT INTO Owner VALUES( 005, 'Rocky', 'Balboa', '892345678', 'rockychampion@yahoo.com');
	INSERT INTO Owner VALUES( 006, 'Charles', 'Dickens', '892345679',NULL);
	INSERT INTO Owner VALUES( 007, 'Samuel', 'Dempsey', '892345680', 'iamsamuel@gmail.com');
	INSERT INTO Owner VALUES( 008, 'Andrew', 'Simon', '892345681','simona@yahoo.com');

/* SELECT * FROM OWNER; */

	CREATE TABLE IF NOT EXISTS Buyer
	(
	  Buyer_ID INT NOT NULL AUTO_INCREMENT,
	  FName VARCHAR(20) NOT NULL,
	  SName VARCHAR(20) NOT NULL,
	  Budget INT,
	  Phone_No INT  NOT NULL,
	  Bed_Requirement INT,
	  Bath_Requiremen INT,
	  PRIMARY KEY (Buyer_ID),
	  CONSTRAINT check_Phone_No3 CHECK ( Phone_No < 10000000000 )
	);

	INSERT INTO Buyer VALUES( 001, 'Abhi', 'Kaush', 650000, '873345678', 5, 3);
	INSERT INTO Buyer VALUES( 002, 'Arthur', 'King', 560000, '873345679', NULL, NULL);
	INSERT INTO Buyer VALUES( 003, 'Elizabeth', 'Keene', NULL, '873345680',3, NULL);
	INSERT INTO Buyer VALUES( 004, 'Emma', 'Riley', 270000, '873345681', 1, 1);
	INSERT INTO Buyer VALUES( 005, 'Jackson', 'Stuart', 720000, '873345682', 3, 3);
	INSERT INTO Buyer VALUES( 006, 'Michael', 'Langford', NULL, '873345683', 3, NULL);
	INSERT INTO Buyer VALUES( 007, 'Kizzy', 'Giles', 480000, '873345684', NULL, NULL);
	INSERT INTO Buyer VALUES( 008, 'Marry', 'Joeseph', 550000, '873345685', 3, 2);

/* SELECT * FROM Buyer; */


	CREATE TABLE IF NOT EXISTS Features
	(
	  Feature_ID INT NOT NULL AUTO_INCREMENT,
	  Feat_Name  VARCHAR(60) NOT NULL,
	  Feat_Description VARCHAR(255),
	  PRIMARY KEY (Feature_ID)
	);

	INSERT INTO Features VALUES(001, 'Central Heating', 'House has a Centralised Heating System');
	INSERT INTO Features VALUES(002, 'Attic Convertable', 'The attic has provision to convert the attic into a room');
	INSERT INTO Features VALUES(003, 'Parking Space', NULL);
	INSERT INTO Features VALUES(004, 'Solar Panel', 'House has Solar Panels');
	INSERT INTO Features VALUES(005, 'Alarm System', NULL);

/* SELECT * FROM FEATURES; */

	CREATE TABLE IF NOT EXISTS Property
	(
	  Property_ID INT NOT NULL AUTO_INCREMENT,
	  Property_Status VARCHAR(20) NOT NULL,
	  Date_Updated DATE NOT NULL,
	  Price INT NOT NULL,
	  Street CHAR(255) NOT NULL,
	  Town CHAR(255) NOT NULL,
	  County CHAR(255) NOT NULL,
	  EIRCODE VARCHAR(7) UNIQUE,
	  Bedroom INT,
	  Bathroom INT,
	  Area INT,
	  Property_Type VARCHAR(20) NOT NULL,
	  Owner_ID INT NOT NULL,
	  PRIMARY KEY (Property_ID),
	  FOREIGN KEY (Owner_ID) REFERENCES Owner(Owner_ID),
	  CONSTRAINT check_Property_Status CHECK(Property_Status = 'For Sale' OR Property_Status = 'Sale Agreed' OR Property_Status = 'Sold'),
	  CONSTRAINT check_EIRCODE CHECK(CHARACTER_LENGTH(EIRCODE) = 7 AND SUBSTRING(EIRCODE FROM 1 FOR 1) BETWEEN 'A' AND 'Z'),
	  CONSTRAINT check_Property_Type CHECK(Property_Type IN ( 'House','Apartment', 'Bungalow', 'Duplex','Cottage', 'Other'))
	);


	INSERT INTO Property VALUES(001, 'For Sale', '2020-02-15', 550000, '23 Leona Apartment', 'Dun Laoghaire', 'Dublin', 'A86V6YB', 2, 2, 93, 'Apartment', 002); 
	INSERT INTO Property VALUES(002, 'For Sale', '2020-03-1', 575000, '42 Cabinteeley Avenue', 'Cabinteeley', 'Dublin 8', 'H26L1A0', 4, 3, 164, 'House', 006); 
	INSERT INTO Property VALUES(003, 'For Sale', '2020-01-14', 300000, '1 Cube Apartments', 'Cabinteeley', 'Dublin 8', 'H26L3B1', 2, NULL, 72, 'Apartment', 005); 
	INSERT INTO Property VALUES(004, 'Sale Agreed', '2020-09-24', 480000, '15 Bluemoon Road', 'Celbridge', 'Kildare', 'M12H3R1', 3, 2, 120, 'Bungalow', 008); 
	INSERT INTO Property VALUES(005, 'For Sale', '2019-12-01', 675000, '99 Carricmines Manor', 'Carrickmines', 'Dublin 18', 'G26K2P3', 5, 3, NULL, 'House', 004);
	INSERT INTO Property VALUES(006, 'Sale Agreed', '2020-7-17', 520000, '11 County Ridge', 'Portsmanrock', 'Dublin 5', 'N13H5G9', 3, 2, 115, 'Duplex', 003); 
	INSERT INTO Property VALUES(007, 'For Sale', '2020-09-21', 430000, '12 Willow Rose', 'Celbridge', 'Kildare', 'M12H4F2', 2, 3, 102, 'Duplex', 001); 
	INSERT INTO Property VALUES(008, 'Sale Agreed', '2020-04-19', 850000, 'Serena Estate', 'Foxrock', 'Dublin', 'C23L9P1', 5, 4, 201, 'House', 007); 


/* SELECT * FROM Property; */
/*
(Prints Property ID, Street, Price, Owner Name)
SELECT Property.Property_ID, Property.Street, Property.Price, Owner.FName, Owner.SName FROM Property, Owner where Property.Owner_ID = Owner.Owner_ID;
*/

    CREATE TABLE IF NOT EXISTS Viewing
	(
	  Viewing_ID INT NOT NULL AUTO_INCREMENT,
	  Viewing_Time TIME(2) NOT NULL,
	  Viewing_Date DATE NOT NULL,
	  Employee_ID INT NOT NULL,
	  Property_ID INT NOT NULL,
	  Buyer_ID INT NOT NULL,
	  PRIMARY KEY (Viewing_ID),
	  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
	  FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
	  FOREIGN KEY (Buyer_ID) REFERENCES Buyer(Buyer_ID)
	);
  
	INSERT INTO Viewing VALUES (001,'13:30', '2020-12-15', 001, 002, 001);
    INSERT INTO Viewing VALUES (002,'15:15', '2020-11-17', 001, 002, 002);
    INSERT INTO Viewing VALUES (003,'10:00', '2020-09-20', 003, 004, 006); 
	INSERT INTO Viewing VALUES (004,'12:45', '2020-10-1', 005, 001, 002);
    INSERT INTO Viewing VALUES (005,'15:00', '2020-07-19', 007, 003, 004);
    INSERT INTO Viewing VALUES (006,'09:45', '2020-08-08', 006, 005, 005);
    INSERT INTO Viewing VALUES (007,'16:00', '2020-07-12', 004, 006, 001);
    INSERT INTO Viewing VALUES (008,'12:30', '2020-03-30', 001, 008, 003);
 
/* SELECT * FROM Viewing; */


 /*
 (Prints Property ID Owner ID Owner Name and Date Updated for the House whose sale is agreed. Can be used by manager)
    select property_id, Property.owner_id, Owner.FName, date_updated, Property_Status from Property, Owner where Property_Status = 'Sale Agreed' AND Owner.Owner_ID = Property.Owner_ID;
 */
   
CREATE TABLE Sale_Record
(
  Sale_Records_ID INT NOT NULL AUTO_INCREMENT,
  Sale_Date DATE NOT NULL,
  Sale_Price INT NOT NULL,
  Branch_ID INT NOT NULL,
  Property_ID INT NOT NULL,
  Buyer_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  Owner_ID INT NOT NULL,
  PRIMARY KEY (Sale_Records_ID),
  FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID),
  FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
  FOREIGN KEY (Buyer_ID) REFERENCES Buyer(Buyer_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Owner_ID) REFERENCES Owner(Owner_ID)
);

/* SELECT * FROM Sale_Record; */

CREATE TABLE Commission
(
  Commission_ID INT NOT NULL AUTO_INCREMENT,
  Commission_Date DATE NOT NULL,
  Amount INT NOT NULL,
  Sale_Records_ID INT NOT NULL,
  PRIMARY KEY (Commission_ID),
  FOREIGN KEY (Sale_Records_ID) REFERENCES Sale_Record(Sale_Records_ID)
);

/* SELECT * FROM Commission; */


CREATE TABLE Property_Features
(
  Property_ID INT NOT NULL,
  Feature_ID INT NOT NULL,
  PRIMARY KEY (Property_ID, Feature_ID),
  FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
  FOREIGN KEY (Feature_ID) REFERENCES Features(Feature_ID)
);

INSERT INTO Property_Features VALUES(001, 001);
INSERT INTO Property_Features VALUES(001, 003);
INSERT INTO Property_Features VALUES(001, 005);
INSERT INTO Property_Features VALUES(002, 001);
INSERT INTO Property_Features VALUES(002, 002);
INSERT INTO Property_Features VALUES(002, 003);
INSERT INTO Property_Features VALUES(003, 005);
INSERT INTO Property_Features VALUES(004, 003);
INSERT INTO Property_Features VALUES(004, 005);
INSERT INTO Property_Features VALUES(005, 001);
INSERT INTO Property_Features VALUES(005, 002);
INSERT INTO Property_Features VALUES(005, 003);
INSERT INTO Property_Features VALUES(005, 004);
INSERT INTO Property_Features VALUES(005, 005);
INSERT INTO Property_Features VALUES(006, 004);
INSERT INTO Property_Features VALUES(006, 005);
INSERT INTO Property_Features VALUES(007, 001);
INSERT INTO Property_Features VALUES(007, 003);
INSERT INTO Property_Features VALUES(007, 005);
INSERT INTO Property_Features VALUES(008, 001);
INSERT INTO Property_Features VALUES(008, 002);
INSERT INTO Property_Features VALUES(008, 003);
INSERT INTO Property_Features VALUES(008, 005);


/* Select * From Property_Features; */
/*
select distinct Property.Street, Features.Feat_Name from Property, Features, Property_Features where Features.Feat_Name = 'Parking Space' ;
*/


-- 2 TRIGGERS
DELIMITER $$
CREATE TRIGGER Update_Property_Details
AFTER INSERT ON Sale_Record FOR EACH ROW
begin
	DECLARE New_Owner varchar(50);
    -- Creating Buyer into a New Owner
    INSERT INTO Owner(Owner_ID, FName, SName, Phone_No) select NULL, Buyer.FName, Buyer.SName, Buyer.Phone_No from Buyer where Buyer.Buyer_ID = NEW.Buyer_ID;
    
    -- Tagging the new Owner as the Owner of the property
     Select Max(Owner_ID) from Owner into New_Owner;
     -- Satus to Sold and Price to Sale Price
       UPDATE Property 
     SET Property.Property_Status = 'Sold', Property.Price = New.Sale_Price, Property.Owner_ID = New_Owner, Property.Date_Updated = New.Sale_Date
    WHERE New.Property_ID = Property.Property_ID; 
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER Allocate_Commmission
AFTER INSERT ON Sale_Record FOR EACH ROW
begin
	-- Giving Commission to the Employee in the sale
    INSERT INTO Commission(Commission_ID, Commission_Date, Amount, Sale_Records_ID) SELECT null, New.Sale_Date, (0.01*New.Sale_Price), New.Sale_Records_ID; 
END;
$$
DELIMITER ;


-- These Values result into Sale of 3 Houses	
INSERT INTO Sale_Record VALUES(001, '2020-09-24', 485000, 003, 004,006,005, 008);
INSERT INTO Sale_Record VALUES(002, '2020-07-17', 535000, 002, 006, 001, 004, 003);
INSERT INTO Sale_Record VALUES(003, '2020-04-19', 845000, 001, 008, 003, 001, 007); 
 






-- SECURITY and VIEWS
/* 3 VIEWS CREATED */
CREATE VIEW Viewing_List AS
    (SELECT 
        Viewing.Viewing_ID,
        Property.Street AS Address,
        Property.Price,
        Buyer.FName AS Visitor_FName,
        Buyer.SName AS Visitor_SName,
        Viewing.Viewing_Date AS Viewing_Date,
        Viewing.Viewing_Time,
        Employee.FName AS Employee_FName,
        Employee.SName AS Employee_SName
    FROM
        Viewing,
        Property,
        Employee,
        Buyer
    WHERE
        Viewing.Buyer_ID = Buyer.Buyer_ID
            AND Viewing.Employee_ID = Employee.Employee_ID
            AND Viewing.Property_ID = Property.Property_ID);


CREATE VIEW Empoyee_Commission_Record AS
    (SELECT 
        Commission.Commission_ID,
        Commission.Amount AS Commission_Earned,
        Employee.FName AS Employee_FName,
        Employee.SName AS Employee_SName,
        Property.Street AS Property_Name,
        Property.Price AS Sale_Price,
        Sale_Record.Sale_Date
    FROM
        Commission,
        Employee,
        Property,
        Sale_Record
    WHERE
        Commission.Sale_Records_ID = Sale_Record.Sale_Records_ID
            AND Sale_Record.Employee_ID = Employee.Employee_ID
            AND Sale_Record.Property_ID = Property.Property_ID
            );
    
    
    
CREATE VIEW Active_Employee_Database AS
    SELECT 
        Employee.Employee_ID,
        Employee.FName AS Employee_FName,
        Employee.SName AS Employee_SName,
        Emp_Position AS Position
    FROM
        Employee
    WHERE
        Employee.Emp_Status = 'Active';
 
 



CREATE ROLE IF NOT EXISTS MANAGER;
CREATE ROLE IF NOT EXISTS EXECUTIVE;

GRANT ALL ON Empoyee_Commission_Record TO MANAGER WITH GRANT OPTION;
GRANT ALL ON Viewing_List TO MANAGER WITH GRANT OPTION;
GRANT ALL ON Active_Employee_Database TO MANAGER WITH GRANT OPTION;

GRANT INSERT, SELECT, UPDATE ON Viewing_List TO EXECUTIVE;
GRANT SELECT, UPDATE ON Active_Employee_Database TO EXECUTIVE;

-- SELECT * From Viewing_List;
-- SELECT * From Empoyee_Commission_Record;
-- SELECT * FROM Active_Employee_Database;
