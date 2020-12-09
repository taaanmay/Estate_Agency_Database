
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
  PPS VARCHAR(9) NOT NULL,
  Branch_ID INT NOT NULL,
  PRIMARY KEY (Employee_ID),
  FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID),
  CONSTRAINT check_PPS CHECK(CHARACTER_LENGTH(PPS) = 9 AND SUBSTRING(PPS FROM 1 FOR 1) BETWEEN 'A' AND 'Z'),
  CONSTRAINT check_Position CHECK(Emp_Position = 'Manager' OR Emp_Position = 'Executive'),
  CONSTRAINT check_Status CHECK(Emp_Status = 'Active' OR Emp_Status = 'Inactive')
);

INSERT INTO Employee VALUES( 0001, 'Harry', 'Potter', 'Executive', 'Active', 3000, 'A23456789', 001); 
