##------ JOIN------------

INSERT INTO Branch VALUES
(4, 'Buffalo', NULL, NULL);

Select *
From Branch;

## Find all branches and the names of the managers
Select employee.emp_id, employee.first_name, branch.branch_name
From Employee
JOIN Branch
ON employee.emp_id = branch.mgr_id;

## ------- LEFT JOIN---1-Table------------------------
Select employee.emp_id, employee.first_name, branch.branch_name
From Employee
LEFT JOIN Branch
ON employee.emp_id = branch.mgr_id;

## ------- RIGHT JOIN---2-Table------------------------
Select employee.emp_id, employee.first_name, branch.branch_name
From Employee
RIGHT JOIN Branch
ON employee.emp_id = branch.mgr_id;

##------ UNION ------------
## Find a list of emploeey and brach names
## UNION Same number of column , similar data types
Select first_name AS LIST
From Employee
UNION
Select branch_name
From Branch
UNION
Select client_name
From Client;

## Find a list of all clients & branch suppliers 's name 
Select client_name, branch_id
From Client
Union
Select supplier_name, branch_id
From Branch_supplier;

## Find a list of all money or earned by the company
Select salary
From Employee
Union
Select total_sales
From Works_with;

## --------------------------NESTED Queries----------------------------------------------
## Find name of all the employees who have sold over 30,000 to a single client
Select employee.first_name, employee.last_name
From employee
where employee.emp_id IN (
 Select works_with.emp_id
 From works_with
 where works_with.total_sales > 30000
);

## Find all client who are handled by the branch that Michael Scott manager, you know the id
Select client.client_name
From Client
Where client.branch_id = (
 Select branch.branch_id
 From branch
 Where branch.mgr_id = 102
 Limit 1
);

## -------------------------TRIGGERS--------------------------------------------
## 
CREATE TABLE triggers_test (
  mesagge VARCHAR(100)
);

Select * From triggers_test

/* -------Write the trigger in MYSQL Comand LINE--------------------------------------------
DELIMITER $$
CREATE
   TRIGGER my_trigger BEFORE INSERT
   ON Employee
   FOR EACH ROW BEGIN
       INSERT INTO triggers_test VALUES ('added new employee');
   END$$
DELIMITER ;

*/
;
INSERT INTO Employee VALUES 
(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106 , 3);
Select * From triggers_test;

-------------------------------------------------------------------------------------
/*
DELIMITER $$
CREATE
   TRIGGER my_trigger1 BEFORE INSERT
   ON Employee
   FOR EACH ROW BEGIN
       INSERT INTO triggers_test VALUES (New.first_name);
   END$$
DELIMITER ;

*/
INSERT INTO Employee VALUES 
(110, 'Leo', 'Malone', '1968-02-19', 'M', 69000, 103 , 3);

Select * From triggers_test;

-------------------------------------------------------------------------------------
/*
DELIMITER $$
CREATE
   TRIGGER my_trigger2 BEFORE INSERT
   ON Employee
   FOR EACH ROW BEGIN
       IF New.sex = 'M' THEN
		      INSERT INTO triggers_test VALUES ('added male employee');
	   ELSEIF New.sex = 'F' THEN
              INSERT INTO triggers_test VALUES ('added famale');
	   ELSE 
			 INSERT INTO triggers_test VALUES ('added other employee');
	   END IF;
   END$$
DELIMITER ;

*/
INSERT INTO Employee VALUES 
(111, 'Lola', 'Joseph', '1968-02-19', 'F', 69000, 105 , 1);

Select * From triggers_test;
---------------------------------------------------------------------------------------------------------------
/*
DELIMITER $$
CREATE
   TRIGGER my_trigger AFTER DELETE
   ON Employee
   FOR EACH ROW BEGIN
       INSERT INTO triggers_test VALUES ('added new employee');
   END$$
DELIMITER ;

*/
/* DROP TRIGGER my_trigger;

*/
##------ WILCARD ------------
-------- % any # characters ------ _ one character---------------- 
## Find any client's who are in LLC
Select *
From Client
Where client_name LIKE '%LLC';

## Find any suppliers who are in the label busisness
Select *
From Branch_supplier
Where supplier_name LIKE '%Label%';

## Find any employees born in October
Select *
From Employee
Where birth_day LIKE '____-10%';

## Find any clients how are school
Select *
From Client
Where client_name LIKE '%school%';

