## Creating a new Database
create database WENDY_PORTOFOLIO;

## Creating a  Company Database
CREATE TABLE Employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);
Select * From Employee;


CREATE TABLE Branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
);

Select * From Branch;

## Set Foreing key in the Employee table

ALTER TABLE Employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE Employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

DESCRIBE Employee;

CREATE TABLE Client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);
Select * From Client;

CREATE TABLE Works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES Client(client_id) ON DELETE CASCADE
);

Select * From Works_with ;

CREATE TABLE Branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

Select * From Branch_supplier ;
--------------------------- Corporate --------
INSERT INTO Employee VALUES
(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO Branch VALUES
(1, 'Corporate', 100, '2006-02-09');

UPDATE Employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO Employee VALUES
(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

Select * From Employee;
##------------------------ Scranton--------------------------------------
INSERT INTO Employee VALUES
(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO Branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO Employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO Employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO Employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO Employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO Branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE Employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO Employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO Employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

Select * From Employee;
Select * From Branch;

-- BRANCH SUPPLIER-----------------------------
INSERT INTO Branch_supplier VALUES
(2, 'Hammer Mill', 'Paper'),
(2, 'Uni-ball', 'Writing Utensils'),
(3, 'Patriot Paper', 'Paper'),
(2, 'J.T. Forms & Labels', 'Custom Forms'),
(3, 'Uni-ball', 'Writing Utensils'),
(3, 'Hammer Mill', 'Paper'),
(3, 'Stamford Lables', 'Custom Forms')
;

Select * From Branch_supplier;

-- CLIENT-------------------------
INSERT INTO Client VALUES
(400, 'Dunmore Highschool', 2),
(401, 'Lackawana Country', 2),
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2)
;
Select * From Client;

-- WORKS_WITH--------
INSERT INTO Works_with VALUES
(105, 400, 55000),
(102, 401, 267000),
(108, 402, 22500),
(107, 403, 5000),
(108, 403, 12000),
(105, 404, 33000),
(107, 405, 26000),
(102, 406, 15000),
(105, 406, 130000)
;
Select * From Works_with;