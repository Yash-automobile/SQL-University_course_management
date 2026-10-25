drop database if exists university;
create database university;
use university;

create table department(
departmentid integer primary key,
departmentname varchar(50)
);
insert into department(departmentid, departmentname)
values
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Mechanical Engineering'),
(4, 'Automobile Engineering'),
(5, 'Electrical Engineering'),
(6, 'Civil Engineering'),
(7, 'Information Technology');

create table students(
studentid integer primary key,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
birthdate date,
enrollmentdate date
);
insert into students values
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Patel', 'rahul.patel@email.com', '2002-04-10', '2023-08-01'),
(4, 'Priya', 'Shah', 'priya.shah@email.com', '2001-07-20', '2024-01-15'),
(5, 'Amit', 'Verma', 'amit.verma@email.com', '2000-11-05', '2023-01-10'),
(6, 'Neha', 'Joshi', 'neha.joshi@email.com', '2002-02-18', '2024-08-01'),
(7, 'Karan', 'Mehta', 'karan.mehta@email.com', '2001-09-12', '2025-01-15');

create table courses(
courseid int primary key,
coursename varchar(50),
departmentid integer,
credits int,
foreign key (departmentid) references department(departmentid)
);
insert into courses values
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Calculus', 2, 4),
(104, 'Automobile Engineering', 4, 4),
(105, 'Thermodynamics', 3, 3),
(106, 'Circuit Analysis', 5, 3),
(107, 'Database Management', 7, 4);

create table instructors(
instructorid int primary key,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
departmentid int,
salary decimal(10,2) not null default 0.00,
foreign key (departmentid) references department(departmentid)
);
insert into instructors values
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 75000),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 50000),
(3, 'David', 'Wilson', 'david.wilson@univ.com', 3, 62000),
(4, 'Sarah', 'Brown', 'sarah.brown@univ.com', 4, 35000),
(5, 'Michael', 'Davis', 'michael.davis@univ.com', 5, 54000),
(6, 'Emily', 'Taylor', 'emily.taylor@univ.com', 6, 28000),
(7, 'James', 'Martin', 'james.martin@univ.com', 7, 85000);

create table enrollments(
enrollmentid int primary key,
studentid int,
courseid int,
enrollmentdate date,
foreign key (studentid) references students(studentid),
foreign key (courseid) references courses(courseid)
);
insert into enrollments values
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 3, 101, '2023-08-01'),
(4, 4, 103, '2024-01-15'),
(5, 5, 104, '2023-01-10'),
(6, 6, 105, '2024-08-01'),
(7, 1, 102, '2022-08-01'),
(8, 7, 106, '2025-01-15');

-- =========================================================
-- QUESTION 1: Perform CRUD operations on all tables.
-- =========================================================

-- STUDENTS: CREATE
mysql> insert into students
    -> values (8, 'ravi', 'shah', 'ravi@email.com','2002-06-15', '2025-08-01');
Query OK, 1 row affected (0.045 sec)

mysql> select * from students;
+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | firstname | lastname | email                 | birthdate  | enrollmentdate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com    | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com  | 1999-05-25 | 2021-08-01     |
|         3 | Rahul     | Patel    | rahul.patel@email.com | 2002-04-10 | 2023-08-01     |
|         4 | Priya     | Shah     | priya.shah@email.com  | 2001-07-20 | 2024-01-15     |
|         5 | Amit      | Verma    | amit.verma@email.com  | 2000-11-05 | 2023-01-10     |
|         6 | Neha      | Joshi    | neha.joshi@email.com  | 2002-02-18 | 2024-08-01     |
|         7 | Karan     | Mehta    | karan.mehta@email.com | 2001-09-12 | 2025-01-15     |
|         8 | ravi      | shah     | ravi@email.com        | 2002-06-15 | 2025-08-01     |
+-----------+-----------+----------+-----------------------+------------+----------------+
8 rows in set (0.008 sec)

-- STUDENTS: UPDATE
mysql> update students set email = 'ravi.shah@email.com' where studentid = 8;
Query OK, 1 row affected (0.047 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select studentid, email from students where studentid = 8;
+-----------+---------------------+
| studentid | email               |
+-----------+---------------------+
|         8 | ravi.shah@email.com |
+-----------+---------------------+
1 row in set (0.007 sec)

-- STUDENTS: DELETE
mysql> delete from students
    -> where studentid = 8;
Query OK, 1 row affected (0.088 sec)

mysql> select * from students;
+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | firstname | lastname | email                 | birthdate  | enrollmentdate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com    | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com  | 1999-05-25 | 2021-08-01     |
|         3 | Rahul     | Patel    | rahul.patel@email.com | 2002-04-10 | 2023-08-01     |
|         4 | Priya     | Shah     | priya.shah@email.com  | 2001-07-20 | 2024-01-15     |
|         5 | Amit      | Verma    | amit.verma@email.com  | 2000-11-05 | 2023-01-10     |
|         6 | Neha      | Joshi    | neha.joshi@email.com  | 2002-02-18 | 2024-08-01     |
|         7 | Karan     | Mehta    | karan.mehta@email.com | 2001-09-12 | 2025-01-15     |
+-----------+-----------+----------+-----------------------+------------+----------------+
7 rows in set (0.011 sec)

-- DEPARTMENT: CREATE
mysql> insert into department
    -> values (8, 'chemical engineering');
Query OK, 1 row affected (0.060 sec)

mysql> select * from department;
+--------------+------------------------+
| departmentid | departmentname         |
+--------------+------------------------+
|            1 | Computer Science       |
|            2 | Mathematics            |
|            3 | Mechanical Engineering |
|            4 | Automobile Engineering |
|            5 | Electrical Engineering |
|            6 | Civil Engineering      |
|            7 | Information Technology |
|            8 | chemical engineering   |
+--------------+------------------------+
8 rows in set (0.006 sec)

-- DEPARTMENT: UPDATE
mysql> update department
    -> set departmentname = 'chemical technology'
    -> where departmentid = 8;
Query OK, 1 row affected (0.064 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from department where departmentid = 8;
+--------------+---------------------+
| departmentid | departmentname      |
+--------------+---------------------+
|            8 | chemical technology |
+--------------+---------------------+
1 row in set (0.006 sec)

-- DEPARTMENT: DELETE
mysql> delete from department
    -> where departmentid = 8;
Query OK, 1 row affected (0.061 sec)

mysql> select * from department;
+--------------+------------------------+
| departmentid | departmentname         |
+--------------+------------------------+
|            1 | Computer Science       |
|            2 | Mathematics            |
|            3 | Mechanical Engineering |
|            4 | Automobile Engineering |
|            5 | Electrical Engineering |
|            6 | Civil Engineering      |
|            7 | Information Technology |
+--------------+------------------------+
7 rows in set (0.006 sec)


-- COURSES: CREATE
mysql> insert into courses
    -> values (108, 'python programming', 1, 3);
Query OK, 1 row affected (0.063 sec)

mysql> select * from courses;
+----------+------------------------+--------------+---------+
| courseID | coursename             | departmentID | credits |
+----------+------------------------+--------------+---------+
|      101 | Introduction to SQL    |            1 |       3 |
|      102 | Data Structures        |            1 |       4 |
|      103 | Calculus               |            2 |       4 |
|      104 | Automobile Engineering |            4 |       4 |
|      105 | Thermodynamics         |            3 |       3 |
|      106 | Circuit Analysis       |            5 |       3 |
|      107 | Database Management    |            7 |       4 |
|      108 | python programming     |            1 |       3 |
+----------+------------------------+--------------+---------+
8 rows in set (0.007 sec)

-- COURSES: UPDATE
mysql> update courses
    -> set credits = 4
    -> where courseid = 108;
Query OK, 1 row affected (0.072 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from courses where courseid = 108;
+----------+--------------------+--------------+---------+
| courseID | coursename         | departmentID | credits |
+----------+--------------------+--------------+---------+
|      108 | python programming |            1 |       4 |
+----------+--------------------+--------------+---------+
1 row in set (0.007 sec)

-- COURSES: DELETE
mysql> delete from courses
    -> where courseid = 108;
Query OK, 1 row affected (0.063 sec)

mysql> select * from courses;
+----------+------------------------+--------------+---------+
| courseID | coursename             | departmentID | credits |
+----------+------------------------+--------------+---------+
|      101 | Introduction to SQL    |            1 |       3 |
|      102 | Data Structures        |            1 |       4 |
|      103 | Calculus               |            2 |       4 |
|      104 | Automobile Engineering |            4 |       4 |
|      105 | Thermodynamics         |            3 |       3 |
|      106 | Circuit Analysis       |            5 |       3 |
|      107 | Database Management    |            7 |       4 |
+----------+------------------------+--------------+---------+
7 rows in set (0.007 sec)

-- INSTRUCTORS: CREATE
mysql> insert into instructors
    -> values (8, 'rohan', 'patel', 'rohan@univ.com', 1, 65000);
Query OK, 1 row affected (0.080 sec)

mysql> select * from instructors;
+--------------+-----------+----------+------------------------+--------------+----------+
| instructorid | firstname | lastname | email                  | departmentid | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 75000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 50000.00 |
|            3 | David     | Wilson   | david.wilson@univ.com  |            3 | 62000.00 |
|            4 | Sarah     | Brown    | sarah.brown@univ.com   |            4 | 35000.00 |
|            5 | Michael   | Davis    | michael.davis@univ.com |            5 | 54000.00 |
|            6 | Emily     | Taylor   | emily.taylor@univ.com  |            6 | 28000.00 |
|            7 | James     | Martin   | james.martin@univ.com  |            7 | 85000.00 |
|            8 | rohan     | patel    | rohan@univ.com         |            1 | 65000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+
8 rows in set (0.007 sec)

-- INSTRUCTORS: UPDATE
mysql> update instructors
    -> set email = 'rohan.patel@univ.com'
    -> where instructorid = 8;
Query OK, 1 row affected (0.067 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from instructors where instructorid = 8;
+--------------+-----------+----------+----------------------+--------------+----------+
| instructorid | firstname | lastname | email                | departmentid | Salary   |
+--------------+-----------+----------+----------------------+--------------+----------+
|            8 | rohan     | patel    | rohan.patel@univ.com |            1 | 65000.00 |
+--------------+-----------+----------+----------------------+--------------+----------+
1 row in set (0.007 sec)

-- INSTRUCTORS: DELETE
mysql> delete from instructors
    -> where instructorid = 8;
Query OK, 1 row affected (0.056 sec)

mysql> select * from instructors;
+--------------+-----------+----------+------------------------+--------------+----------+
| instructorid | firstname | lastname | email                  | departmentid | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 75000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 50000.00 |
|            3 | David     | Wilson   | david.wilson@univ.com  |            3 | 62000.00 |
|            4 | Sarah     | Brown    | sarah.brown@univ.com   |            4 | 35000.00 |
|            5 | Michael   | Davis    | michael.davis@univ.com |            5 | 54000.00 |
|            6 | Emily     | Taylor   | emily.taylor@univ.com  |            6 | 28000.00 |
|            7 | James     | Martin   | james.martin@univ.com  |            7 | 85000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+
7 rows in set (0.006 sec)

-- ENROLLMENTS: CREATE
mysql> insert into enrollments
    -> values (9, 1, 102, '2025-08-01');
Query OK, 1 row affected (0.070 sec)

mysql> select * from enrollments;
+--------------+-----------+----------+----------------+
| enrollmentid | studentid | courseid | enrollmentdate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
|            3 |         3 |      101 | 2023-08-01     |
|            4 |         4 |      103 | 2024-01-15     |
|            5 |         5 |      104 | 2023-01-10     |
|            6 |         6 |      105 | 2024-08-01     |
|            7 |         1 |      102 | 2022-08-01     |
|            8 |         7 |      106 | 2025-01-15     |
|            9 |         1 |      102 | 2025-08-01     |
+--------------+-----------+----------+----------------+
9 rows in set (0.007 sec)

-- ENROLLMENTS: UPDATE
mysql> update enrollments
    -> set courseid = 103
    -> where enrollmentid = 9;
Query OK, 1 row affected (0.058 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from enrollments where enrollmentid = 9;
+--------------+-----------+----------+----------------+
| enrollmentid | studentid | courseid | enrollmentdate |
+--------------+-----------+----------+----------------+
|            9 |         1 |      103 | 2025-08-01     |
+--------------+-----------+----------+----------------+
1 row in set (0.007 sec)

-- ENROLLMENTS: DELETE
mysql> delete from enrollments
    -> where enrollmentid = 9;
Query OK, 1 row affected (0.062 sec)

mysql> select * from enrollments;
+--------------+-----------+----------+----------------+
| enrollmentid | studentid | courseid | enrollmentdate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
|            3 |         3 |      101 | 2023-08-01     |
|            4 |         4 |      103 | 2024-01-15     |
|            5 |         5 |      104 | 2023-01-10     |
|            6 |         6 |      105 | 2024-08-01     |
|            7 |         1 |      102 | 2022-08-01     |
|            8 |         7 |      106 | 2025-01-15     |
+--------------+-----------+----------+----------------+
8 rows in set (0.007 sec)


-- =========================================================
-- QUESTION 2: Retrieve students who enrolled after 2022.
-- =========================================================
mysql> select * from students
    -> where enrollmentdate >= '2023-01-01';
+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | firstname | lastname | email                 | birthdate  | enrollmentdate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|         3 | Rahul     | Patel    | rahul.patel@email.com | 2002-04-10 | 2023-08-01     |
|         4 | Priya     | Shah     | priya.shah@email.com  | 2001-07-20 | 2024-01-15     |
|         5 | Amit      | Verma    | amit.verma@email.com  | 2000-11-05 | 2023-01-10     |
|         6 | Neha      | Joshi    | neha.joshi@email.com  | 2002-02-18 | 2024-08-01     |
|         7 | Karan     | Mehta    | karan.mehta@email.com | 2001-09-12 | 2025-01-15     |
+-----------+-----------+----------+-----------------------+------------+----------------+
5 rows in set (0.029 sec)
-- Explanation: The WHERE condition returns students whose enrollment date is in 2023 or later.

-- =========================================================
-- QUESTION 3: Retrieve Mathematics courses, with a limit of 5.
-- =========================================================
mysql> select c.courseid, c.coursename, c.credits
    -> from courses c
    -> join department d
    -> on c.departmentid = d.departmentid
    -> where d.departmentname = 'mathematics'
    -> limit 5;
+----------+------------+---------+
| courseid | coursename | credits |
+----------+------------+---------+
|      103 | Calculus   |       4 |
+----------+------------+---------+
1 row in set (0.009 sec)
-- Explanation: JOIN finds courses belonging to Mathematics, and LIMIT returns at most five rows.

-- =========================================================
-- QUESTION 4: Count students in each course; show courses with more than 5.
-- =========================================================
mysql> SELECT CourseID, COUNT(StudentID) AS TotalStudents
    -> FROM Enrollments
    -> GROUP BY CourseID
    -> HAVING COUNT(StudentID) > 5;
Empty set (0.010 sec)
-- Explanation: HAVING filters grouped courses to those with more than five enrollments; none meet this condition in the sample data.

-- =========================================================
-- QUESTION 5: Students enrolled in BOTH SQL and Data Structures.
-- =========================================================
mysql> SELECT s.StudentID, s.FirstName, s.LastName
    -> FROM Students s
    -> JOIN Enrollments e ON s.StudentID = e.StudentID
    -> JOIN Courses c ON e.CourseID = c.CourseID
    -> WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
    -> GROUP BY s.StudentID, s.FirstName, s.LastName
    -> HAVING COUNT(DISTINCT c.CourseName) = 2;
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
+-----------+-----------+----------+
1 row in set (0.013 sec)
-- Explanation: GROUP BY groups each student, and HAVING keeps students found in both named courses.

-- =========================================================
-- QUESTION 6: Students enrolled in SQL OR Data Structures.
-- =========================================================
mysql> SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
    -> FROM Students s
    -> JOIN Enrollments e ON s.StudentID = e.StudentID
    -> JOIN Courses c ON e.CourseID = c.CourseID
    -> WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         3 | Rahul     | Patel    |
|         2 | Jane      | Smith    |
+-----------+-----------+----------+
3 rows in set (0.009 sec)
-- Explanation: IN returns students enrolled in either course, while DISTINCT avoids duplicate students.

-- =========================================================
-- QUESTION 7: Average credits of all courses.
-- =========================================================
mysql> SELECT AVG(Credits) AS AverageCredits
    -> FROM Courses;
+----------------+
| AverageCredits |
+----------------+
|         3.5714 |
+----------------+
1 row in set (0.006 sec)
-- Explanation: AVG calculates the mean of the seven course-credit values.

-- =========================================================
-- QUESTION 8: Maximum instructor salary in Computer Science.
-- =========================================================
mysql> SELECT MAX(i.Salary) AS MaximumSalary
    -> FROM Instructors i
    -> JOIN Department d
    -> ON i.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = 'Computer Science';
+---------------+
| MaximumSalary |
+---------------+
|      75000.00 |
+---------------+
1 row in set (0.010 sec)
-- Explanation: MAX returns the highest instructor salary in the Computer Science department.

-- =========================================================
-- QUESTION 9: Count students enrolled in courses in each department.
-- =========================================================
mysql> SELECT d.DepartmentName,
    -> COUNT(e.StudentID) AS TotalStudents
    -> FROM Department d
    -> JOIN Courses c ON d.DepartmentID = c.DepartmentID
    -> JOIN Enrollments e ON c.CourseID = e.CourseID
    -> GROUP BY d.DepartmentID, d.DepartmentName;
+------------------------+---------------+
| DepartmentName         | TotalStudents |
+------------------------+---------------+
| Computer Science       |             4 |
| Mathematics            |             1 |
| Automobile Engineering |             1 |
| Mechanical Engineering |             1 |
| Electrical Engineering |             1 |
+------------------------+---------------+
5 rows in set (0.011 sec)
-- Explanation: LEFT JOIN keeps every department, and COUNT(DISTINCT) counts each enrolled student once per department.

-- =========================================================
-- QUESTION 10: INNER JOIN students with their courses.
-- =========================================================
mysql> SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName FROM Students s
    -> INNER JOIN Enrollments e ON s.StudentID = e.StudentID
    -> INNER JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+-----------+----------+------------------------+
| StudentID | FirstName | LastName | CourseName             |
+-----------+-----------+----------+------------------------+
|         1 | John      | Doe      | Introduction to SQL    |
|         2 | Jane      | Smith    | Data Structures        |
|         3 | Rahul     | Patel    | Introduction to SQL    |
|         4 | Priya     | Shah     | Calculus               |
|         5 | Amit      | Verma    | Automobile Engineering |
|         6 | Neha      | Joshi    | Thermodynamics         |
|         1 | John      | Doe      | Data Structures        |
|         7 | Karan     | Mehta    | Circuit Analysis       |
+-----------+-----------+----------+------------------------+
8 rows in set (0.009 sec)
-- Explanation: INNER JOIN returns only students who have a matching enrollment and course.

-- =========================================================
-- QUESTION 11: LEFT JOIN all students with their courses, if any.
-- =========================================================
mysql> SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
    -> FROM Students s LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
    -> LEFT JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+-----------+----------+------------------------+
| StudentID | FirstName | LastName | CourseName             |
+-----------+-----------+----------+------------------------+
|         1 | John      | Doe      | Introduction to SQL    |
|         1 | John      | Doe      | Data Structures        |
|         2 | Jane      | Smith    | Data Structures        |
|         3 | Rahul     | Patel    | Introduction to SQL    |
|         4 | Priya     | Shah     | Calculus               |
|         5 | Amit      | Verma    | Automobile Engineering |
|         6 | Neha      | Joshi    | Thermodynamics         |
|         7 | Karan     | Mehta    | Circuit Analysis       |
+-----------+-----------+----------+------------------------+
8 rows in set (0.009 sec)
-- Explanation: LEFT JOIN preserves all students; students without enrollments would show NULL for CourseName.

-- =========================================================
-- QUESTION 12: Students enrolled in courses with more than 10 students.
-- =========================================================
mysql> SELECT FirstName, LastName
    -> FROM Students
    -> WHERE StudentID IN (
    ->     SELECT StudentID
    ->     FROM Enrollments
    ->     WHERE CourseID IN (
    ->         SELECT CourseID
    ->         FROM Enrollments
    ->         GROUP BY CourseID
    ->         HAVING COUNT(StudentID) > 10
    ->     )
    -> );
Empty set (0.021 sec)
-- Explanation: The subquery finds courses with more than ten enrollments; none meet that condition in the sample data.

-- =========================================================
-- QUESTION 13: Extract the year from each enrollment date.
-- =========================================================
mysql> SELECT StudentID, YEAR(EnrollmentDate) AS EnrollmentYear
    -> FROM Students;
+-----------+----------------+
| StudentID | EnrollmentYear |
+-----------+----------------+
|         1 |           2022 |
|         2 |           2021 |
|         3 |           2023 |
|         4 |           2024 |
|         5 |           2023 |
|         6 |           2024 |
|         7 |           2025 |
+-----------+----------------+
7 rows in set (0.007 sec)
-- Explanation: YEAR() extracts the year from EnrollmentDate in the Enrollments table.

-- =========================================================
-- QUESTION 14: Concatenate each instructor's first and last name.
-- =========================================================
mysql> SELECT CONCAT(FirstName, ' ', LastName) AS InstructorName
    -> FROM Instructors;
+----------------+
| InstructorName |
+----------------+
| Alice Johnson  |
| Bob Lee        |
| David Wilson   |
| Sarah Brown    |
| Michael Davis  |
| Emily Taylor   |
| James Martin   |
+----------------+
7 rows in set (0.009 sec)
-- Explanation: CONCAT joins first name and last name into one InstructorName column.

-- =========================================================
-- QUESTION 15: Running total of student enrollments.
-- =========================================================
mysql> SELECT EnrollmentID, StudentID,
    -> COUNT(*) OVER (ORDER BY EnrollmentID) AS RunningTotal
    -> FROM Enrollments;
+--------------+-----------+--------------+
| EnrollmentID | StudentID | RunningTotal |
+--------------+-----------+--------------+
|            1 |         1 |            1 |
|            2 |         2 |            2 |
|            3 |         3 |            3 |
|            4 |         4 |            4 |
|            5 |         5 |            5 |
|            6 |         6 |            6 |
|            7 |         1 |            7 |
|            8 |         7 |            8 |
+--------------+-----------+--------------+
8 rows in set (0.013 sec)
-- Explanation: The window COUNT increases by one for each enrollment ordered by EnrollmentID.

-- =========================================================
-- QUESTION 16: Label students Senior or Junior by enrollment year.
-- =========================================================
mysql> SELECT FirstName, LastName,
    -> CASE
    -> WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 4
    -> THEN 'Senior'
    -> ELSE 'Junior'
    -> END AS StudentLevel
    -> FROM Students;
+-----------+----------+--------------+
| FirstName | LastName | StudentLevel |
+-----------+----------+--------------+
| John      | Doe      | Junior       |
| Jane      | Smith    | Senior       |
| Rahul     | Patel    | Junior       |
| Priya     | Shah     | Junior       |
| Amit      | Verma    | Junior       |
| Neha      | Joshi    | Junior       |
| Karan     | Mehta    | Junior       |
+-----------+----------+--------------+
7 rows in set (0.007 sec)

-- Explanation: TIMESTAMPDIFF checks completed years since each student's enrollment; more than four years means Senior.
