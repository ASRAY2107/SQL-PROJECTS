-- CREATING DATABASES

-- CREATE

CREATE DATABASE new_database;


-- CREATING TABLES

USE new_database;

CREATE TABLE students ( 
							Roll_No INT, 
                            Name VARCHAR(10), 
                            Age INT, 
                            Phone INT)
                            
                            
                            
SELECT *
FROM students;




-- INSERTING DATA INTO TABLE

INSERT INTO students
VALUES 
				(2,'Bran',19,62847263),
                (3,'Jhon',24,98765655),
                (4,'Max',21,36434242);
             

SELECT *
FROM students;