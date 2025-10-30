1. CLI PostgreSQL Screenshot

![alt text](<Screenshot (141).png>)


2. DataGrip Screenshot

![alt text](<Screenshot (142).png>)

3. ER Diagram

![alt text](<Screenshot (143).png>)

4. Five SQL Queries

![alt text](<Screenshot (145).png>) ![alt text](<Screenshot (146).png>) ![alt text](<Screenshot (147).png>) ![alt text](<Screenshot (148).png>) ![alt text](<Screenshot (149).png>)

SELECT 
  b.title, 
  p.name AS publisher, 
  c.category_name, 
  b.year_published
FROM Books_Inventory b
JOIN Publishers p ON b.publisher_id = p.publisher_id
JOIN Categories c ON b.category_id = c.category_id;

SELECT 
  r.reservation_id, 
  (m.first_name || ' ' || m.last_name) AS member,
  b.title, 
  r.status
FROM Reservations r
JOIN Members m ON r.member_id = m.member_id
JOIN Books_Inventory b ON r.book_id = b.book_id;

SELECT 
  c.category_name, 
  SUM(b.total_copies) AS total_copies
FROM Books_Inventory b
JOIN Categories c ON b.category_id = c.category_id
GROUP BY c.category_name;

SELECT 
  name, 
  role, 
  hire_date
FROM Employees
WHERE hire_date > '2023-01-01';

SELECT 
  p.name AS publisher, 
  COUNT(b.book_id) AS total_books
FROM Publishers p
LEFT JOIN Books_Inventory b ON p.publisher_id = b.publisher_id
GROUP BY p.name;

5. Reflection

Setting up the library_db was a good learning experience. At first, I faced some errors while creating tables because I forgot to add semicolons and sometimes ran commands in the wrong order. I also learned that when using foreign keys, the main table must be created before the one that references it. Another issue was that column names had to match exactly in queries; for example, I used name instead of first_name and last_name, which caused errors. I fixed these problems by checking the table structure using the \d command in PostgreSQL. Writing SQL queries helped me understand how JOIN, GROUP BY, and WHERE clauses work together to get the right data. I also learned how to combine first and last names using string operators. Overall, this project helped me become more confident with SQL commands and database relationships. It showed me the importance of careful syntax and testing each step before moving on. Now I feel more comfortable creating and managing tables, inserting data, and writing queries to answer real-world questions about the data.