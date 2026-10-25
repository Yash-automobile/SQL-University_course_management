# University Course Management System

## Overview
The University Course Management System is a MySQL-based project designed to manage university departments, students, courses, instructors, and enrollments. It demonstrates relational database design and practical SQL query operations using sample data.

## Database Tables
The project contains five tables:

- **Department:** Stores department IDs and department names.
- **Students:** Stores student details, email addresses, birth dates, and enrollment dates.
- **Courses:** Stores course names, department IDs, and credit values.
- **Instructors:** Stores instructor details, department assignments, and salaries.
- **Enrollments:** Stores student-course enrollment records and enrollment dates.

## Key Features
- Database and table creation
- Inserting, retrieving, updating, and deleting records (CRUD)
- Primary key and foreign key constraints
- Filtering records using `WHERE` and `LIMIT`
- Joining tables using `INNER JOIN` and `LEFT JOIN`
- Grouping and filtering grouped data using `GROUP BY` and `HAVING`
- Aggregate functions such as `COUNT()`, `AVG()`, and `MAX()`
- Subqueries and the `IN` operator
- Removing duplicate results using `DISTINCT`
- Date functions such as `YEAR()` and `TIMESTAMPDIFF()`
- String manipulation using `CONCAT()`
- Window functions using `COUNT() OVER()`
- Conditional logic using `CASE`

## SQL Practice Questions
The project includes 16 SQL exercises:

1. Perform CRUD operations on all tables.
2. Retrieve students enrolled from 2023 onward.
3. Retrieve Mathematics courses with a limit of five records.
4. Count students enrolled in each course and display courses with more than five enrollments.
5. Find students enrolled in both Introduction to SQL and Data Structures.
6. Find students enrolled in either Introduction to SQL or Data Structures.
7. Calculate the average credits of all courses.
8. Find the maximum instructor salary in the Computer Science department.
9. Count student enrollments in courses by department.
10. Retrieve students and their courses using `INNER JOIN`.
11. Retrieve all students and their courses using `LEFT JOIN`.
12. Find students enrolled in courses with more than ten enrollments.
13. Extract the enrollment year.
14. Combine instructors' first and last names.
15. Calculate a running total of enrollments.
16. Classify students as Senior or Junior based on their enrollment date.

## Technologies Used
- MySQL
- SQL
- MySQL Command-Line Client

## How to Run
1. Install and start MySQL Server.
2. Open the MySQL Command-Line Client or a compatible SQL editor.
3. Open the `University_course_management.sql` file.
4. Execute the database creation and table creation statements.
5. Insert the sample records.
6. Run the SQL queries and review
