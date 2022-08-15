# Exercise 1

CREATE DATABASE entrylevel_employee;
SHOW databases;
USE entrylevel_employee;
CREATE table Trainer_info(
 -> Trainer__id VARCHAR(20) NOT NULL PRIMARY KEY,
 -> Salutation VARCHAR(7) NOT NULL,
 -> Trainer_name VARCHAR(30) NOT NULL,
 -> Trainer_location VARCHAR(30) NOT NULL,
 -> Trainer_Track VARCHAR(15) NOT NULL,
 -> Trainer_Qualification VARCHAR(100) NOT NULL,
 -> Trainer_Experience INT(11) NOT NULL,
 -> Trainer_Email VARCHAR(100) NOT NULL,
 -> Trainer_Password VARCHAR(20) NOT NULL
 -> );
SHOW tables;
DESC Trainer_Info;
CREATE table Batch_info(
 -> Batch_id VARCHAR(20) NOT NULL PRIMARY KEY,
 -> Batch_Owner VARCHAR(30) NOT NULL,
 -> Batch_BU_Name VARCHAR(30) NOT NULL
 -> );
DESC Batch_info;
CREATE table Module_Info(
 -> Module_id VARCHAR(20) NOT NULL PRIMARY KEY,
 -> Module_Name VARCHAR(40) NOT NULL,
 -> Module_Duration INT(11)
 -> );
DESC Module_info;
CREATE table Associate_Info(
 -> Associate_Id VARCHAR(20) NOT NULL PRIMARY KEY,
 -> Salutation VARCHAR(7) NOT NULL,
 -> Associate_Name VARCHAR(30) NOT NULL,
 -> Associate_Location VARCHAR(30) NOT NULL,
 -> Associate_Track VARCHAR(15) NOT NULL,
 -> Associate_Qualification VARCHAR(200) NOT NULL,
 -> Associate_Email VARCHAR(100) NOT NULL,
 -> Associate_Password VARCHAR(20) NOT NULL
 -> )
 -> ;
SHOW tables;
DESC Associate_Info;
CREATE table Questions(
 -> Question_id VARCHAR(20) NOT NULL PRIMARY KEY,
 -> Module_id VARCHAR(20) NOT NULL,
 -> Question_Text VARCHAR(900) NOT NULL,
 -> FOREIGN KEY (Module_id) REFERENCES Module_Info(Module_id)
 -> );
SHOW tables;
DESC Questions;
CREATE table Associate_Status(
 -> Associate_Id VARCHAR(20),
 -> Module_Id VARCHAR(20),
 -> Batch_Id VARCHAR(20),
 -> Trainer_Id VARCHAR(20),
 -> Start_Date VARCHAR(20),
 -> End_Date VARCHAR(20),
 -> PRIMARY KEY(Associate_Id,Module_Id),
 -> FOREIGN KEY (Batch_Id) REFERENCES Batch_Info(Batch_Id),
 -> FOREIGN KEY (Trainer_Id) REFERENCES Trainer_Info(Trainer__Id)
 -> );
SHOW tables;
DESC Associate_Status;
CREATE table Trainer_Feedback(
 -> Trainer_Id VARCHAR(20) NOT NULL,
 -> Question_Id VARCHAR(20) NOT NULL,
 -> Batch_Id VARCHAR(20) NOT NULL,
 -> Module_Id VARCHAR(20) NOT NULL,
 -> Trainer_Rating INT(11),
 -> FOREIGN KEY (Trainer_Id) REFERENCES Trainer_Info(Trainer__Id),
 -> FOREIGN KEY (Question_id) REFERENCES Questions(Question_id),
 -> FOREIGN KEY (Batch_Id) REFERENCES Batch_info(Batch_Id),
 -> FOREIGN KEY (Module_Id) REFERENCES Module_Info(Module_Id)
 -> );
SHOW tables;
DESC Trainer_Feedback;
CREATE table Associate_Feedback(
 -> Associate_Id VARCHAR(20) NOT NULL,
 -> Question_Id VARCHAR(20) NOT NULL,
 -> Module_Id VARCHAR(20) NOT NULL,
 -> Associate_Rating INT(11),
 -> FOREIGN KEY (Associate_Id) REFERENCES Associate_Info(Associate_Id),
 -> FOREIGN KEY (Question_id) REFERENCES Questions(Question_id),
 -> FOREIGN KEY (Module_Id) REFERENCES Module_Info(Module_Id)
 -> );
SHOW tables;
DESC Associate_Feedback;
CREATE table Login_Details(
 -> User_Id VARCHAR(20) NOT NULL PRIMARY KEY,
 -> User_Password VARCHAR(20) NOT NULL
 -> );
SHOW tables;
DESC Login_Details;

# Exercise 2

INSERT INTO 
Trainer_Info(Trainer__Id,Salutation,Trainer_Name,Trainer_Location,Trainer_Track,Trainer_Qualifica
tion,Trainer_Experience,Trainer_Email,Trainer_Password)
 -> values('F001','Mr.','PANKAJ GHOSH','Pune','Java','Bachelor of 
Technology',12,'Pankaj.Ghosh@alliance.com','fac1@123'),
 -> ('F002','Mr.','SANJAY RADHAKRISHNAN','Bangalore','DotNet','Bachelor of 
Technology',12,'Sanjay.RadhaKrishnan@alliance.com','fac2@123'),
 -> ('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of 
Technology',10,'Vijay.Mathur@alliance.com','fac3@123'),
 -> ('F004','Mrs.','NANDINI NAIR','Kolkata','Java','Master of Computer 
Applications',9,'Nandini.Nair@alliance.com','fac4@123'),
 -> ('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer 
Applications',6,'Anitha.Parekh@alliance.com','fac5@123'),
 -> ('F006','Mr.','MANOJ AGRAWAL','Mumbai','Mainframe','Bachelor of 
Technology',9,'Manoj.Agrawal@alliance.com','fac6@123'),
 -> ('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of 
Technology',5,'Meena.Kulkarni@alliance.com','fac7@123'),
 -> ('F008','Mr.','SAGAR MENON','Mumbai','Java','Master of Science in Information 
Technology',12,'Sagar.Menon@alliance.com','fac8@123');
SELECT * FROM Trainer_Info;
INSERT INTO Batch_info(Batch_Id,Batch_Owner,Batch_BU_Name)
 -> values('B001','MRS.SWATI ROY','MSP'),
 -> ('B002','MRS.ARUNA K','HEALTHCARE'),
 -> ('B003','MR.RAJESH KRISHNAN','LIFESCIENCES'),
 -> ('B004','MR.SACHIN SHETTY','BFS'),
 -> ('B005','MR.RAMESH PATEL','COMMUNICATIONS'),
 -> ('B006','MRS.SUSAN CHERIAN','RETAIL & HOSPITALITY'),
 -> ('B007','MRS.SAMPADA JAIN','MSP'),
 -> ('B008','MRS.KAVITA REGE','BPO'),
 -> ('B009','MRS.RAVI SEJPAL','MSP');
SELECT * FROM Batch_info;
INSERT INTO Module_Info(Module_Id,Module_Name,Module_Duration)
 -> values('O10SQL','Oracle 10g SQL',16),
 -> ('010PLSQL','Oracle 10g PL/SQL',16),
 -> ('J2SE','Core Java SE 1.6',288),
 -> ('J2EE','Advanced Java EE 1.6',80),
 -> ('JAVAFX','JavaFX 2.1',80),
 -> ('DOTNT4','.Net Framework 4.0',50),
 -> ('SQL2008','MS SQL Server 2008',120),
 -> ('MSBI08','MS BI Studio 2008',158),
 -> ('SHRPNT','MS Share Point',80),
 -> ('ANDRD4','Android 4.0',200),
 -> ('EM001','Instructor',0),
 -> ('EM002','Course Material',0),
 -> ('EM003','Learning Effectiveness',0),
 -> ('EM004','Environment',0),
 -> ('EM005','Job Impact',0),
 -> ('TM001','Attendees',0),
 -> ('TM002','Couse Material',0),
-> ('TM003','Environment',0);
SELECT * FROM Module_Info;
INSERT INTO 
Associate_Info(Associate_Id,Salutation,Associate_Name,Associate_Location,Associate_Track,Associa
te_Qualification,Associate_Email,Associate_Password)
 -> values('A001','Miss.','GAYATHRI NARAYANAN','Gurgaon','Java','Bachelor of 
Technology','Gayathri.Narayanan@hp.com','tne1@123'),
 -> ('A002','Mrs.','RADHIKA MOHAN','Kerala','Java','Bachelor of Engineering in Information 
Technology','Radhika.Mohan@Cognizant.com','tne2@123'),
 -> ('A003','Mr.','KISHORE SRINIVAS','Chennai','Java','Bachelor of Engineering in 
Computers','Kishore.Srinivas@ibm.com','tne3@123'),
 -> ('A004','Mr.','ANAND RANGANATHAN','Mumbai','DotNet','Master of Computer 
Applications','Anand.Ranganathan@finolex.com','tne4@123'),
 -> ('A005','Miss.','LEELA MENON','Kerala','Mainframe','Bachelor of Engineering in Information 
Technology','Leela.Menon@microsoft.com','tne5@123'),
 -> ('A006','Mrs.','ARTI KRISHNAN','Pune','Testing','Master of Computer 
Applications','Arti.Krishnan@cognizant.com','tne6@123'),
 -> ('A007','Mr.','PRABHAKAR SHUNMUGHAM','Mumbai','Java','Bachelor of 
Technology','Prabhakar.Shunmugham@cognizant.com','tne7@123');
SELECT * FROM Associate_Info;
INSERT INTO Questions(Question_Id,Module_Id,Question_Text)
 -> values('Q001','EM001','Instructor knowledgeable and able to handle all your queries'),
-> ('Q002','EM001','All the topics in a particular course handled by the trainer without any gaps or 
slippages'),
 -> ('Q003','EM002','The course materials presentaion, handson, etc. refered during the training 
are relevant and useful.'),
 -> ('Q004','EM002','The Hands on session adequate enough to grasp the understanding of the 
topic'),
 -> ('Q005','EM002','The reference materials suggested for each module are adequate.'),
 -> ('Q006','EM003','Knowledge and skills presented in this training are applicable at your work'),
 -> ('Q007','EM003','This training increases my proficiency level'),
 -> ('Q008','EM004','The physical environment e.g. classroom space, air-conditioning was 
conducive to learning.'),
 -> ('Q009','EM004','The software/hardware environment provided was sufficient for the purpose 
of the training.'),
 -> ('Q010','EM005','This training will improve your job performance.'),
 -> ('Q011','EM005','This training align with the business priorities and goals.'),
 -> ('Q012','TM001','Participants were receptive and had attitude towards learning.'),
 -> ('Q013','TM001','All participants gained the knowledge and the practical skills after this 
training.'),
 -> ('Q014','TM002','The course materials presentation, handson, etc. available for the session 
covers the entire objectives of the course.'),
 -> ('Q015','TM002','Complexity of the course is adequate for the participate level.'),
 -> ('Q016','TM002','Case study and practical demos helpful in understanding of the topic.'),
 -> ('Q017','TM003','The physical environment e.g. classroom space, air-conditoning was conducive 
to learning.'),
 -> ('Q018','TM003','The software/hardware environment provided was adequate for the purpose 
of the training.');
SELECT * FROM Questions;
INSERT INTO Associate_Status(Associate_Id,Module_Id,Batch_Id,Trainer_Id,Start_Date,End_Date)
 -> values('A001','O10SQL','B001','F001','2000-12-15','2000-12-25'),
 -> ('A002','O10SQL','B001','F001','2000-12-15','2000-12-25'),
 -> ('A003','O10SQL','B001','F001','2000-12-15','2000-12-25'),
 -> ('A001','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
 -> ('A002','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
 -> ('A003','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
 -> ('A001','J2SE','B003','F003','2002-8-20','2002-10-25'),
 -> ('A002','J2SE','B003','F003','2002-8-20','2002-10-25'),
 -> ('A001','J2EE','B004','F004','2005-12-1','2005-12-25'),
 -> ('A002','J2EE','B004','F004','2005-12-1','2005-12-25'),
-> ('A003','J2EE','B004','F004','2005-12-1','2005-12-25'),
 -> ('A004','J2EE','B004','F004','2005-12-1','2005-12-25'),
 -> ('A005','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
 -> ('A006','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
 -> ('A006','SQL2008','B006','F007','2007-6-21','2007-6-28'),
 -> ('A007','SQL2008','B006','F007','2007-6-21','2007-6-28'),
 -> ('A002','MSBI08','B007','F006','2009-6-26','2009-6-29'),
 -> ('A003','MSBI08','B007','F006','2009-6-26','2009-6-29'),
 -> ('A004','MSBI08','B007','F006','2009-6-26','2009-6-29'),
 -> ('A002','ANDRD4','B008','F005','2010-6-5','2010-6-28'),
 -> ('A005','ANDRD4','B008','F005','2010-6-5','2010-6-28'),
 -> ('A003','ANDRD4','B009','F005','2011-8-1','2011-8-20'),
 -> ('A006','ANDRD4','B009','F005','2011-8-1','2011-8-20');
SELECT * FROM Associate_Status;

# Exercise 3

UPDATE Trainer_Info SET Trainer_Password = 'nn4@123'
WHERE Trainer__ID='F004';
SELECT Trainer__Id, Trainer_Password FROM Trainer_Info;

# Exercise 4

DELETE FROM Associate_Status
WHERE Associate_ID='A003' AND Module_Id='J2EE' AND Batch_Id='B004' AND Trainer_Id='F004' 
AND Start_Date='2005-12-1' AND End_Date='2005-12-25';
SELECT Associate_ID, Module_Id FROM Associate_Status
WHERE Associate_ID='A003' AND Module_Id='J2EE';

# Exercise 5

SELECT * FROM Trainer_Info
ORDER BY Trainer_Experience DESC
LIMIT 5;

# Exercise 6

SELECT * FROM Login_Details;
START TRANSACTION;
INSERT INTO (User_Id, User_Password)
 -> values('U001','Admin1@123'),
 -> ('U002','Admin2@123');
SELECT * FROM Login_Details;

# Exercise 7

CREATE USER 'CKrithika@localhost' IDENTIFIED BY 'password';
GRANT CREATE, SELECT ON sqlassessment TO 'CKrithika@localhost';
START TRANSACTION;
INSERT INTO Login_Details(User_Id, User_Password)
 -> values('U001','Admin1@123'),
 -> ('U002','Admin2@123');
SELECT * FROM Login_Details;
ROLLBACK;
SELECT * FROM Login_Details;
REVOKE CREATE, SELECT ON sqlassessment FROM 'CKrithika@localhost';

# Exercise 8

Drop table Login_Details;
DESC Login_Details;

# Exercise 9

CREATE TABLE suppliers(
 -> supplier_id INT(10) NOT NULL PRIMARY KEY,
 -> supplier_name VARCHAR(50) NOT NULL,
 -> address VARCHAR(50),
 -> city VARCHAR(50),
 -> state VARCHAR(25),
 -> zip_code VARCHAR(10)
 -> );
DESC suppliers;

# Exercise 10

CREATE TABLE course(
 -> course_code VARCHAR(20) NOT NULL PRIMARY KEY,
 -> base_fees INT(11),
 -> special_fees INT(11),
 -> Created_by VARCHAR(30),
 -> Updated_by VARCHAR(30)
 -> );
DESC course;
CREATE TABLE Course_Fees(
 -> course_code INT(5) NOT NULL PRIMARY KEY,
 -> base_fees INT(11),
 -> special_fees INT(11),
 -> discount INT(11)
 -> );
DESC Course_Fees;
INSERT INTO Course_Fees (course_code,base_fees,special_fees,discount)
 -> values(1,180,100,10),
 -> (2,150,110,10),
 -> (3,160,170,5),
 -> (4,150,100,10),
 -> (6,190,100,40);
CREATE TABLE Course_Fees_History(
 -> course_code INT(5) NOT NULL PRIMARY KEY,
 -> base_fees INT(11),
 -> special_fees INT(11),
 -> created_by VARCHAR(30),
 -> updated_by VARCHAR(30)
 -> );
DESC Course_Fees_History;
INSERT INTO Course_Fees_History(Course_code, base_fees, special_fees, created_by, updated_by)
 -> values(1,120,123,'Ram','Ramesh'),
 -> (2,150,110,'Bala','Ram'),
 -> (3,160,170,'Bala','Vinu'),
 -> (4,170,235,'Ram','Ram'),
 -> (5,190,100,'Vinod','Vinod');
SELECT * FROM Course_Fees_History;

# Exercise 11

SELECT COUNT(*) FROM course_fees;
#count on number of rows in course_fees
SELECT COUNT(DISTINCT(course_code)) FROM Course_Fees;
SELECT COUNT(DISTINCT(base_fees)) FROM Course_Fees;
SELECT COUNT(DISTINCT(special_fees)) FROM Course_Fees;
SELECT COUNT(*) FROM Course_Fees_History;
#count on number of rows in Course_Fees_History
SELECT COUNT(DISTINCT(course_code)) FROM Course_Fees_History;
SELECT COUNT(DISTINCT(base_fees)) FROM Course_Fees_History;
SELECT COUNT(DISTINCT(special_fees)) FROM Course_Fees_History;

# Exercise 12

CREATE TABLE Course_info(
 course_code VARCHAR(10) NOT NULL PRIMARY KEY,
 course_name VARCHAR(20),
 course_description VARCHAR(20),
course_start_date DATE,
 course_duration INT(11),
no_of_participants INT(11),
 course_type CHAR(3)
 );
DESC Course_info;
CREATE TABLE Student_info(
 -> student_id VARCHAR(10),
 -> first_name VARCHAR(20),
 -> last_name VARCHAR(25),
 -> address VARCHAR(150),
 -> PRIMARY KEY (student_id)
 -> );
DESC student_info;
INSERT INTO Course_Fees (course_code,base_fees,special_fees,discount)
 -> values(7,NULL,195,20),
 -> (8,NULL,120,40)
 -> (9,300,180,15),
 -> (10,175,155,10);
SELECT * FROM Course_fees;
SELECT MAX(base_fees) FROM Course_fees;
SELECT MIN(IFNULL(base_fees,0)) FROM course_fees;

# Exercise 17

INSERT INTO
course_info(course_code,course_name,course_description,course_start_date,course_duration,no_
of_participants,course_type,message)
 -> values('166','AI','rbstudies','2022-08-06',42,12,'CLR','Class Room'),
 -> ('167','ML','Machine Learning','2022-08-08',34,10,'EL','ELearning'),
 -> ('168','PY','python','2022-08-06',18,6,'OF','Offline Reading');
SELECT * FROM course_info

# Exercise 13

CREATE TABLE newcol(
 -> id INT NOT NULL PRIMARY KEY,
 -> infra_fees DECIMAL(5,3));
DESC newcol;
ALTER TABLE course_fees ADD infra_fees DECIMAL(5,3);
SELECT * FROM course_fees;
SELECT * FROM newcol;
SELECT AVG(newcol.infra_fees) FROM course_fees INNER JOIN newcol ON 
course_fees.course_code=newcol.id;

# Exercise 14

SELECT DATEDIFF(curdate(),course_start_date) FROM course_info;

# Exercise 15

SELECT CONCAT('<',course_name,'>','<',course_code,'>') FROM course_info;

# Exercise 16

SELECT AVG(IFNULL(base_fees,0)) FROM course_fees;


# Exercise 18

SELECT course_start_date, SUM(no_of_participants) AS total_participants
 -> FROM course_info 
 -> GROUP BY course_start_date;

# Exercise 19

SELECT course_start_date, SUM(no_of_participants) AS total_participants
 -> FROM course_info
 -> WHERE course_type='CLR'
 -> GROUP BY course_start_date;

# Exercise 20

SELECT course_start_date, SUM(no_of_participants) AS total_participants
 -> FROM course_info
 -> WHERE course_type='CLR'
 -> GROUP BY course_start_date
 -> HAVING SUM(no_of_participants)>10;

# Exercise 21

SELECT course_name FROM course_info ORDER BY course_duration DESC;

# Exercise 22

ALTER TABLE student_info ADD course_code VARCHAR(20);
ALTER TABLE student_info ADD CONSTRAINT FOREIGN KEY (course_code) REFERENCES 
course_info(course_code);
SELECT * FROM student_info;
DESC student_info;
INSERT INTO student_info (student_id, first_name, last_name, address, course_code)
 -> values('1','Mia','Yang','Mexico',167),
 -> ('2','Peter','White','London',166),
 -> ('3','Ruby','Smith','Phillipines',167);
SELECT 
student_info.student_id,student_info.first_name,student_info.last_name,student_info.course_code 
FROM student_info
 -> INNER JOIN course_info
 -> ON student_info.course_code=course_info.course_code WHERE 
student_info.course_code='167';

# Exercise 23

SELECT * FROM course_fees;
ALTER TABLE course_fees DELETE infra_fees;
INSERT INTO course_fees (course_code, base_fees, special_fees, discount)
 -> values(166,170,160,10),
 -> (168,162,140,5);
INSERT INTO course_info values
 -> ('6','SQL','SQuery Language','2022-07-22',64,20,'EL','ELearning'),
 -> ('9','MSAS', 'MSAzure Studio','2022-08-02',246,25,'CLR','Class Room');
SELECT course_fees.discount, course_info.course_description
 -> FROM course_fees
 -> INNER JOIN course_info
 -> ON course_fees.course_code = course_info.course_code;

# Exercise 24

SELECT student_info.first_name,student_info.course_code
 -> FROM student_info LEFT JOIN course_info
 -> ON student_info.course_code = course_info.course_code;
SELECT student_info.first_name,student_info.course_code
 -> FROM student_info RIGHT JOIN course_info
 -> ON student_info.course_code = course_info.course_code;

# Exercise 25

SELECT * FROM course_info;
INSERT INTO course_info VALUES(
 -> '10','Java','IntelliJ','2022-07-16',296, 45, 'CLR','Class Room'),
 -> ('5','EIDE','EclipseIDE','2022-07-25',120,12,'EL','ELearning');
SELECT * FROM course_info;
SELECT * FROM course_fees;
INSERT INTO course_fees VALUES(
 -> 167,183,198,15),
 -> (5,145,176,30);
SELECT * FROM course_fees;
SELECT * FROM student_info;
DESC student_info;
SELECT DISTINCT student_info.student_id FROM student_info
 -> INNER JOIN course_fees
 -> ON student_info.course_code=course_fees.course_code
 -> WHERE (base_fees+special_fees)*(1-discount/100)<1500;

# Exercise 26

SELECT DISTINCT student_info.student_id,student_info.first_name,student_info.last_name
 -> FROM student_info
 -> INNER JOIN course_fees ON student_info.course_code=course_fees.course_code
 -> WHERE (base_fees+special_fees)*(1-discount/100)<1500;
