Homework2. course registration database

Creating database

![alt text](<Screenshot (160).png>)

SQL code

-- ==============================================
-- COURSE REGISTRATION DATABASE
-- ==============================================

-- Drop existing tables (in correct dependency order)
DROP TABLE IF EXISTS Enrollments CASCADE;
DROP TABLE IF EXISTS CourseOfferings CASCADE;
DROP TABLE IF EXISTS Students CASCADE;
DROP TABLE IF EXISTS Courses CASCADE;
DROP TABLE IF EXISTS Professors CASCADE;

-- ==============================================
-- CREATE TABLES
-- ==============================================

-- STUDENTS TABLE
CREATE TABLE Students (
    student_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    major VARCHAR(80) NOT NULL,
    year INT NOT NULL,
    CONSTRAINT chk_students_year CHECK (year BETWEEN 1 AND 5)
);

-- COURSES TABLE
CREATE TABLE Courses (
    course_id BIGSERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE, -- e.g., CS101
    title VARCHAR(150) NOT NULL,
    credits INT NOT NULL,
    department VARCHAR(80) NOT NULL,
    CONSTRAINT chk_course_credits CHECK (credits BETWEEN 1 AND 6)
);

-- PROFESSORS TABLE
CREATE TABLE Professors (
    professor_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department VARCHAR(80) NOT NULL,
    office VARCHAR(40)
);

-- COURSE OFFERINGS TABLE
CREATE TABLE CourseOfferings (
    offering_id BIGSERIAL PRIMARY KEY,
    course_id BIGINT NOT NULL REFERENCES Courses(course_id) ON DELETE RESTRICT,
    professor_id BIGINT NOT NULL REFERENCES Professors(professor_id) ON DELETE RESTRICT,
    semester VARCHAR(10) NOT NULL, -- e.g., 'Fall', 'Spring'
    year INT NOT NULL,
    CONSTRAINT uq_offering UNIQUE (course_id, professor_id, semester, year)
);

-- ENROLLMENTS TABLE
CREATE TABLE Enrollments (
    enrollment_id BIGSERIAL PRIMARY KEY,
    student_id BIGINT NOT NULL REFERENCES Students(student_id) ON DELETE CASCADE,
    course_id BIGINT NOT NULL REFERENCES Courses(course_id) ON DELETE RESTRICT,
    semester VARCHAR(10) NOT NULL,
    grade CHAR(2), -- e.g., 'A', 'B+', 'C'
    CONSTRAINT uq_enrollment UNIQUE (student_id, course_id, semester),
    CONSTRAINT chk_grade CHECK (
        grade IS NULL OR grade IN ('A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D', 'F')
    )
);

-- ==============================================
-- INSERT SAMPLE DATA
-- ==============================================

INSERT INTO Students (name, email, major, year) VALUES
('Ravi Teja', 'ravi.teja@example.com', 'Computer Science', 3),
('Lakshmi Priya', 'lakshmi.priya@example.com', 'Information Systems', 2),
('Sai Charan', 'sai.charan@example.com', 'Electrical Engineering', 4),
('Divya Reddy', 'divya.reddy@example.com', 'Mechanical Engineering', 1),
('Anil Kumar', 'anil.kumar@example.com', 'Data Science', 2);

INSERT INTO Courses (course_code, title, credits, department) VALUES
('CS101', 'Database Systems', 3, 'Computer Science'),
('EE202', 'Circuit Analysis', 4, 'Electrical Engineering'),
('ME303', 'Thermodynamics', 3, 'Mechanical Engineering'),
('DS404', 'Machine Learning', 4, 'Data Science');

INSERT INTO Professors (name, email, department, office) VALUES
('Dr. Srinivas Rao', 'srinivas.rao@example.com', 'Computer Science', 'CS-201'),
('Dr. Kavitha Devi', 'kavitha.devi@example.com', 'Electrical Engineering', 'EE-102'),
('Dr. Ramesh Naidu', 'ramesh.naidu@example.com', 'Mechanical Engineering', 'ME-110');

INSERT INTO CourseOfferings (course_id, professor_id, semester, year) VALUES
(1, 1, 'Fall', 2025),
(2, 2, 'Spring', 2025),
(3, 3, 'Fall', 2025),
(4, 1, 'Spring', 2025);

INSERT INTO Enrollments (student_id, course_id, semester, grade) VALUES
(1, 1, 'Fall', 'A'),
(2, 1, 'Fall', 'B'),
(3, 2, 'Spring', 'A'),
(4, 3, 'Fall', 'B'),
(5, 4, 'Spring', 'A'),
(1, 4, 'Spring', 'A');

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM professors;
SELECT * FROM courseofferings;
SELECT * FROM enrollments;

-- ==============================================
-- QUERIES
-- ==============================================

-- 1. List all students with their majors
SELECT name, major, year FROM Students;

-- 2. Show which courses each student is enrolled in
SELECT s.name AS student_name, c.title AS course_title, e.semester, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- 3. Find which professor teaches which course
SELECT p.name AS professor_name, c.title AS course_title, co.semester, co.year
FROM CourseOfferings co
JOIN Professors p ON co.professor_id = p.professor_id
JOIN Courses c ON co.course_id = c.course_id;

-- 4. Count how many students are in each course
SELECT c.title AS course_title, COUNT(e.student_id) AS total_students
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.title
ORDER BY total_students DESC;



Screenshot of Table creation statement


![alt text](<Screenshot (162).png>)


Sample data (SELECT * FROM each tables)

![alt text](<Screenshot (163).png>)

![alt text](<Screenshot (164).png>)

![alt text](<Screenshot (165).png>)

![alt text](<Screenshot (166).png>)

![alt text](<Screenshot (167).png>)

Query Screenshots

![alt text](<Screenshot (168).png>)

![alt text](<Screenshot (169).png>)

![alt text](<Screenshot (170).png>)

![alt text](<Screenshot (171).png>)

![alt text](<Screenshot (172).png>)

Insert screenshots

![alt text](<Screenshot (163).png>)

![alt text](<Screenshot (164).png>)

![alt text](<Screenshot (165).png>)

![alt text](<Screenshot (166).png>)

![alt text](<Screenshot (167).png>)





