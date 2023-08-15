## BASIC QUERYS
select *
From student;

select name, major
From student;

select student.name, student.major
From student;

## ORDER BY
select student.name, student.major
From student
ORDER By name DESC;

select *
From student
ORDER By name DESC;

select *
From student
ORDER By major , student_id;

## -----------LIMIT-------------
select *
From student
LIMIT 2;

select *
From student
ORDER By  student_id desc
LIMIT 2;

## WHERE
select *
From student
Where major ='Biology';

select name, major
From student
Where major ='Biology';

select name, major
From student
Where major ='Biology' OR major = 'English';

##---------------- < > <= >= <> = AND OR -------------------------------------

select student_id 
From student
Where student_id >3;

## ---------------------IN ------------------------------------------------
select * 
From student
Where name IN ('Claire','Katie', 'Wendy');

select * 
From student
Where name IN ('Claire','Katie', 'Wendy') AND student_id > 2;

## -----------------------Create a table---------------------------------------
CREATE TABLE student (
 student_id INT PRIMARY KEY,
 name VARCHAR(20),
 major VARCHAR(20)
);

DESCRIBE student;

## -------------------------Delete a table------------------------------------------
DROP TABLE student;

##----------------------------- Delete a specific column---------------------------------
ALTER TABLE student DROP COLUMN  gpa;

CREATE TABLE student (
 student_id INT,
 name VARCHAR(20),
 major VARCHAR(20),
 PRIMARY KEY (student_id)
);

## ------------------Modify a table-- add a new table --------------------------------------
ALTER TABLE student ADD gpa DECIMAL (3, 2);

## -------------------Inserting values-----------------------------------------------
INSERT INTO student VALUES (1, 'Jack', 'Biology');

Select * FROM student;

INSERT INTO student VALUES 
(2, 'Katie', 'Sociology'),
(3, 'Claire', 'English'),
(4, 'Jack', 'Biology'),
(5, 'Jack', 'Comp.Sci')
;

INSERT INTO student (student_id,name) VALUES(6, 'Wendy'); 

## ---------------------------Create a table 2---------------------------------------------
## Not Null -- UNIQUE
CREATE TABLE student2 (
 student_id INT,
 name VARCHAR(20) NOT NULL, 
 major VARCHAR(20) UNIQUE,
 PRIMARY KEY (student_id)
);

Select * FROM student2;
INSERT INTO student2 VALUES
(1, 'Jack', 'Biology'), 
(2, 'Katie', 'Sociology'),
(3, 'Claire','Chemistry'),
(4, 'Jack', 'Spanish'),
(5, 'Jack', 'Comp.Sci')
;

## --------------------------------Default--------------------------------------------------
Drop Table student3;
CREATE TABLE student3 (
 student_id INT,
 name VARCHAR(20) , 
 major VARCHAR(20) default 'undecieded',
 PRIMARY KEY (student_id)
);

Select * FROM student3;
INSERT INTO student3 VALUES
(1, 'Jack', 'Biology'), 
(2, 'Katie', 'Sociology'),
(3, 'Claire','Chemistry')
;
INSERT INTO student3 (student_id,name) VALUES(4, 'Jack');

## ---------------------------------AUTO_INCREMENT--------------------------------------------------
CREATE TABLE student4 (
 student_id INT auto_increment,
 name VARCHAR(20) , 
 major VARCHAR(20) ,
 PRIMARY KEY (student_id)
);
Select * FROM student4;
INSERT INTO student4 (name, major) VALUES('Jack','Biology');
INSERT INTO student4 (name, major) VALUES('Kate', NULL);
INSERT INTO student4 (name, major) VALUES( NULL, 'Chemistry');
INSERT INTO student4 (name, major) VALUES( 'Jack', 'Biology');
INSERT INTO student4 (name, major) VALUES('Mike', 'Compturer Science');

## ----------------------DELETE - UPDATE-----------------------------------------------------
## Change the name in a acolumn
UPDATE student4
SET major = 'Bio'
WHERE major = 'Biology';

UPDATE student4
SET major = 'Comp'
WHERE student_id = 6;

UPDATE student4
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'Chemistry';

UPDATE student4
SET name = 'Tom', major = 'udefined'
WHERE student_id = 1;

UPDATE student4
SET major = 'udefined';

## ----------------------Delete -----------------------------------------------------------------
Select * FROM student2;
Delete from student2;

Delete from student2
where student_id = 5;

Delete from student2
where name = 'Claire' AND major = 'Chemistry'; 

## -------------------------ON DELETE-SET-NULL--------------------------------------------
## 
CREATE TABLE Branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
);

Delete From Employee
Where emp_id = 102;

Select *
From employee;

##---------------------------- On DELETE CASACADE---------------------------------------
CREATE TABLE Branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

Delete From branch
Where branch_id = 2;

Select *
From branch_supplier;
