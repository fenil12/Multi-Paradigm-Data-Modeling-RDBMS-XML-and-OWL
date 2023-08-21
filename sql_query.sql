--Questions:

--1)List the ID and name of all students.
SELECT student_id, student_name FROM student;

--2)List the name of all courses together with their type.
SELECT course_name, course_type FROM course;

--3)List the ID and name of all students together with the course name and course type that 
--they study
SELECT s.student_id, s.student_name, c.course_name, c.course_type
FROM student s
JOIN course c ON s.fk_course_id = c.course_id;

--4)List the ID and name of all modules together with the name and ID of the member of 
--staff who teaches this module. 
SELECT m.module_code, m.module_name, e.employee_name, e.employee_id
FROM module m
JOIN employee e ON m.fk_employee_id = e.employee_id;

--5)List the ID and name of all students together with the name of their supervisors
SELECT s.student_id, s.student_name, e.employee_name AS supervisor_name
FROM student s
JOIN employee e ON s.fk_employee_id = e.employee_id;