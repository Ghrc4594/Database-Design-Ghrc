-- ==========================================
-- 1. DROP TABLES IF THEY EXIST
-- ==========================================
DROP TABLE IF EXISTS Rentals CASCADE;
DROP TABLE IF EXISTS Members CASCADE;
DROP TABLE IF EXISTS Movies CASCADE;

-- ======================
-- 2. CREATE TABLES
-- ======================

-- Movies Table
CREATE TABLE Movies (
  movie_id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  director VARCHAR(100) NOT NULL,
  release_year INTEGER,
  genre VARCHAR(50) NOT NULL,
  available BOOLEAN DEFAULT TRUE
);

-- Members Table
CREATE TABLE Members (
  member_id SERIAL PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  join_date DATE DEFAULT CURRENT_DATE
);

-- Rentals Table
CREATE TABLE Rentals (
  rental_id SERIAL PRIMARY KEY,
  member_id INTEGER NOT NULL REFERENCES Members(member_id) ON DELETE CASCADE,
  movie_id INTEGER NOT NULL REFERENCES Movies(movie_id) ON DELETE CASCADE,
  rental_date DATE NOT NULL DEFAULT CURRENT_DATE,
  return_date DATE,
  price_paid NUMERIC(5,2) NOT NULL DEFAULT 3.99,
  returned BOOLEAN DEFAULT FALSE
);

-- ======================
-- 3. INSERT SAMPLE DATA
-- ======================

-- Insert Movies
INSERT INTO Movies (title, director, release_year, genre)
VALUES
('Akhanda', 'Boyapati Srinu', 2021, 'Action'),
('Legend', 'Boyapati Srinu', 2014, 'Action/Drama'),
('Simha', 'Boyapati Srinu', 2010, 'Action'),
('Veera Simha Reddy', 'Gopichand Malineni', 2023, 'Action/Drama'),
('Gautamiputra Satakarni', 'Krish', 2017, 'Historical/Action');

-- Insert Members
INSERT INTO Members (email, first_name, last_name)
VALUES
('arjun.gottipati@example.com', 'Arjun', 'Gottipati'),
('sravani.cherukuri@example.com', 'Sravani', 'Cherukuri'),
('tejaswi.konidela@example.com', 'Tejaswi', 'Konidela'),
('harsha.manchu@example.com', 'Harsha', 'Manchu'),
('lavanya.alluri@example.com', 'Lavanya', 'Alluri'),
('rakesh.nandamuri@example.com', 'Rakesh', 'Nandamuri');

-- Insert Rentals
INSERT INTO Rentals (member_id, movie_id, rental_date, return_date, price_paid, returned)
VALUES
(1, 1, '2025-10-10', '2025-10-13', 4.99, TRUE),
(2, 2, '2025-10-25', NULL, 3.99, FALSE),
(3, 3, '2025-09-28', '2025-10-01', 2.99, TRUE),
(4, 4, '2025-10-27', NULL, 5.99, FALSE),
(5, 5, '2025-08-15', '2025-08-17', 3.50, TRUE),
(6, 1, '2025-09-20', '2025-09-22', 4.50, TRUE),
(6, 3, '2025-10-05', '2025-10-07', 3.25, TRUE);

-- ======================
-- 4. BASIC CHECK QUERY
-- ======================
SELECT * FROM Movies;

-- ======================
-- 5. REQUIRED JOIN QUERY
-- ======================
-- Combines Rentals, Members, and Movies
SELECT
  r.rental_id,
  m.member_id,
  m.first_name || ' ' || m.last_name AS member_name,
  m.email,
  mo.movie_id,
  mo.title,
  mo.genre,
  r.rental_date,
  r.return_date,
  r.price_paid,
  r.returned
FROM Rentals r
JOIN Members m ON r.member_id = m.member_id
JOIN Movies mo ON r.movie_id = mo.movie_id
ORDER BY r.rental_date DESC;

-- ======================
-- 6. ADDITIONAL QUERIES (3 REQUIRED)
-- ======================

-- Query 1: WHERE + ORDER BY
-- Show movies released after 2018, ordered by release year
SELECT movie_id, title, director, release_year, genre, available
FROM Movies
WHERE release_year >= 2018
ORDER BY release_year DESC, title;

-- Query 2: GROUP BY + COUNT
-- Count how many movies exist per genre
SELECT genre, COUNT(*) AS movies_in_genre
FROM Movies
GROUP BY genre
ORDER BY movies_in_genre DESC;

-- Query 3: GROUP BY + HAVING + SUM
-- Total spending per member, only members who spent > $5
SELECT
  m.member_id,
  m.first_name || ' ' || m.last_name AS member_name,
  COUNT(r.rental_id) AS rentals_count,
  SUM(r.price_paid) AS total_spent
FROM Members m
LEFT JOIN Rentals r ON m.member_id = r.member_id
GROUP BY m.member_id, m.first_name, m.last_name
HAVING SUM(r.price_paid) > 5.00
ORDER BY total_spent DESC;

-- ======================
-- 7. DATA UNIQUENESS PROOF
-- ======================
SELECT
  (SELECT COUNT(*) FROM Movies) AS movie_count,
  (SELECT COUNT(DISTINCT genre) FROM Movies) AS genre_count,
  (SELECT STRING_AGG(title, ', ') FROM Movies) AS titles;