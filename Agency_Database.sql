
CREATE TABLE Branch
(
  Branch_ID INT NOT NULL,
  Name CHAR(30) NOT NULL,
  Phone_No INT NOT NULL,
  Street_ CHAR(20),
  Town_ CHAR(20),
  County CHAR(20),
  PRIMARY KEY (Branch_ID),
  CONSTRAINT check_Phone_No CHECK ( Phone_No < 10000000000 )
);


Insert Into Branch Values(001, 'South Motors', 894111873, 'Honeypark', 'Dun Laoghaire', 'Dublin');
Insert Into Branch Values(002, 'North Motors', 0894865585, 'Sword Centre', 'Sword', 'Dublin 9');
Insert Into Branch Values(003, 'Car Trust Motors', 864222345, 'Naas Rd', 'Naas', 'Wicklow');
/*
Select * from branch;
*/



CREATE TABLE Employee
(
  Employee_ID INT NOT NULL,
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
  CONSTRAINT check_Status CHECK(Emp_Status = 'Active' OR Emp_Status = 'Inactive')
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

/*
Select * from employee where emp_position = 'manager';
*/

CREATE TABLE Owner
(
  Owner_ID INT NOT NULL,
  FName VARCHAR(20) NOT NULL,
  SName VARCHAR(20) NOT NULL,
  Phone_No INT NOT NULL,
  PRIMARY KEY (Owner_ID),
  CONSTRAINT check_Phone CHECK ( Phone_No < 10000000000 )
);


INSERT INTO Owner VALUES( 001, 'Jude', 'Law', '862345678');
INSERT INTO Owner VALUES( 002, 'Zach', 'Jones', '862345679');
INSERT INTO Owner VALUES( 003, 'Cody', 'Jones', '862345680');
INSERT INTO Owner VALUES( 004, 'Rick', 'Lax', '862345681');
INSERT INTO Owner VALUES( 005, 'Rocky', 'Balboa', '892345678');
INSERT INTO Owner VALUES( 006, 'Charles', 'Dickens', '892345679');
INSERT INTO Owner VALUES( 007, 'Cody', 'Jones', '892345680');
INSERT INTO Owner VALUES( 008, 'Andrew', 'Simon', '892345681');

/*
select * from owner
*/

CREATE TABLE Buyer
(
  Buyer_ID INT NOT NULL,
  FName VARCHAR(20) NOT NULL,
  SName VARCHAR(20) NOT NULL,
  Budget INT,
  Phone_No INT UNIQUE NOT NULL,
  Bed_Requirement INT,
  Bath_Requiremen INT,
  PRIMARY KEY (Buyer_ID),
  CONSTRAINT check_Phone_No3 CHECK ( Phone_No < 10000000000 )
);




