-- Exercises 1 --
-- a --
SELECT DISTINCT M.DirectorName
FROM Movie M
JOIN StarsIn S ON M.title = S.movieTitle AND M.year = S.movieYear
JOIN MovieStar MS ON S.starname = MS.name
WHERE MS.country = 'America';

-- b --
SELECT DISTINCT M.title, M.year
FROM Movie M
JOIN Show S ON M.title = S.movieTitle
JOIN Theater T ON S.theaterName = T.theaterName
WHERE M.language = 'English' AND S.spectators = T.capacity;

-- c --
SELECT MS.name
FROM MovieStar MS
JOIN StarsIn S ON MS.name = S.starname
JOIN Movie M ON S.movieTitle = M.title AND S.movieYear = M.year
WHERE M.year BETWEEN 2017 AND 2018
GROUP BY MS.name
HAVING COUNT(DISTINCT M.title) >= 3;

-- d --
SELECT M.title
FROM Movie M
JOIN Show S ON M.title = S.movieTitle
WHERE M.filmtype = 'F'
GROUP BY M.title, M.year
HAVING SUM(S.spectators) >= 1000000;

-- e --
SELECT M.title, SUM(S.ticketPrice * S.spectators) AS total_income
FROM Movie M
JOIN Show S ON M.title = S.movieTitle
JOIN Theater T ON S.theaterName = T.theaterName
WHERE T.country = 'America'
GROUP BY M.title;

-- Exercises 2
-- a
SELECT DISTINCT MS.name
FROM MovieStar MS
JOIN StarsIn S ON MS.name = S.starname
JOIN Movie M ON S.movieTitle = M.title AND S.movieYear = M.year
WHERE M.DirectorName = 'Jon Watts';

-- b --
SELECT S.movieTitle, SUM(S.spectators) AS total_spectators
FROM Show S
JOIN Theater T ON S.theaterName = T.theaterName
WHERE T.city = 'LA'
GROUP BY S.movieTitle;

-- c --
SELECT B.custName
FROM Booking B
JOIN Show S ON B.showId = S.showId
GROUP BY B.custName
HAVING COUNT(DISTINCT S.movieTitle) > 1;

-- d --
SELECT T.theaterName
FROM Theater T
JOIN Show S ON T.theaterName = S.theaterName
GROUP BY T.theaterName
HAVING SUM(S.ticketPrice * S.spectators) > 50000;

-- e --
SELECT B.custName
FROM Booking B
JOIN Show S ON B.showId = S.showId
GROUP BY B.custName
HAVING COUNT(DISTINCT S.theaterName) > 1;

