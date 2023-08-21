CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255)
);

CREATE TABLE office (
    office_id INT PRIMARY KEY,
    location VARCHAR(255)
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
	dob DATE,
    employee_role VARCHAR(255),
    employee_position VARCHAR(255),
    fk_dept_id INT,
	fk_office_id INT,
	FOREIGN KEY (fk_dept_id) REFERENCES department(dept_id),
	FOREIGN KEY (fk_office_id) REFERENCES office(office_id)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_type VARCHAR(255),
    course_name VARCHAR(255),
    credits INT
);


CREATE TABLE module (
    module_code INT PRIMARY KEY,
    module_name VARCHAR(255),
    module_type VARCHAR(255),
    credits INT,
    fk_course_id INT,
    fk_employee_id INT,
    FOREIGN KEY (fk_course_id) REFERENCES course(course_id),
    FOREIGN KEY (fk_employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE student (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(50),
  gender VARCHAR(10),
  dob DATE,
  address VARCHAR(100),
  contact_details VARCHAR(50),
  fk_course_id INT,
  fk_employee_id INT,
  FOREIGN KEY (fk_course_id) REFERENCES course(course_id),
  FOREIGN KEY (fk_employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE exam_record (
  exam_record_id INT PRIMARY KEY,
  year INT,
  semester VARCHAR(10),
  mark_achieved INT,
  grade CHAR(1) GENERATED ALWAYS AS (
    CASE 
      WHEN mark_achieved >= 50 THEN 'P'
      ELSE 'F'
    END
  ),
  fk_module_code INT,
  fk_student_id INT,
  FOREIGN KEY (fk_module_code) REFERENCES module(module_code),
  FOREIGN KEY (fk_student_id) REFERENCES student(student_id)
);

INSERT INTO department (dept_id, dept_name) VALUES
(1, 'Computer and Information Science'),
(2, 'Strathclyde Institute of Pharmacy & Biomedical Sciences'),
(3, 'Mathematics and Statistics'),
(4, 'Physics'),
(5, 'Pure and Applied Chemistry');

INSERT INTO office (office_id, location) VALUES
(1, 'Glasgow'),
(2, 'London'),
(3, 'Mumbai'),
(4, 'Paris'),
(5, 'Sydney');

INSERT INTO employee (employee_id, employee_name, dob, employee_role, employee_position, fk_dept_id,fk_office_id) VALUES
(1, 'John Smith', '1985-05-15', 'academic', 'lecturer', 1, 1),
(2, 'Jane Doe', '1987-11-02', 'admin', 'manager', 1, 1),
(3, 'John Cena', '1990-08-10', 'academic', 'professor', 1, 1),
(4, 'Ash Ketchum', '1992-03-22', 'admin', 'assistant manager', 2, 1),
(5, 'Naruto Uzumaki', '1988-09-01', 'academic', 'assistant professor', 1, 1);

INSERT INTO course (course_id, course_type, course_name, credits)
VALUES
(1, 'undergraduate', 'Bachelor of Science in Computer Science', 240),
(2, 'postgraduate', 'Master of Science in Physics', 180),
(3, 'undergraduate', 'Bachelor of Science in Chemistry', 240),
(4, 'postgraduate', 'Master of Science in Data Science', 180),
(5, 'undergraduate', 'Bachelor of Science in Mathematics', 240);

INSERT INTO module (module_code, module_name, module_type, credits, fk_course_id, fk_employee_id)
VALUES
(101, 'Physics Project Dissertation', 'Compulsory', 60, 2, 5),
(102, 'Algorithms and Data Structures', 'Compulsory', 20, 1, 1),
(103, 'Introduction to Pharmacology', 'Elective', 10, 3, 3),
(104, 'Calculus and Analysis', 'Compulsory', 20, 5, 1),
(105, 'Software Engineering', 'Compulsory', 20, 1, 1);

INSERT INTO student (student_id, student_name, gender, dob, address, contact_details, fk_course_id, fk_employee_id)
VALUES
(1, 'Lara Croft', 'Female', '2001-04-15', '123 Main Street, Glasgow', '123-456-7890', 1, 1),
(2, 'Harry Maguire', 'Male', '2002-07-22', '456 High Street, London', '987-654-3210', 2, 3),
(3, 'Kalpana Chawla', 'Female', '2001-01-05', '789 West Street, Mumbai', '567-890-1234', 1, 1),
(4, 'David Brown', 'Male', '2002-11-30', '321 East Street, Paris', '234-567-8901', 4, 5),
(5, 'Emily Davis', 'Female', '2001-06-18', '654 North Street, Sydney', '901-234-5678', 5, 5);

INSERT INTO exam_record (exam_record_id, year, semester, mark_achieved, fk_module_code, fk_student_id)
VALUES
(1, 2021, 'Spring', 75, 101, 1),
(2, 2021, 'Spring', 40, 102, 2),
(3, 2021, 'Winter', 62, 103, 3),
(4, 2021, 'Spring', 80, 104, 4),
(5, 2021, 'Spring', 35, 105, 5);
