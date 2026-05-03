-- Exercises 1 --
-- a --
CREATE VIEW FullyBookedShows AS
SELECT M.title AS movie_title, S.theaterName, T.country, T.city
FROM Movie M
JOIN Show S ON M.title = S.movieTitle
JOIN Theater T ON S.theaterName = T.theaterName
WHERE S.spectators = T.capacity;

SELECT * FROM FullyBookedShows;

-- b --
CREATE VIEW ActorMovieCount AS
SELECT MS.name AS actor_name, MS.country, COUNT(SI.movieTitle) AS num_movies
FROM MovieStar MS
LEFT JOIN StarsIn SI ON MS.name = SI.starname
GROUP BY MS.name, MS.country;

SELECT * FROM ActorMovieCount;

-- c --
CREATE FUNCTION TotalEarning (@movieTitle CHAR(30))
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total DECIMAL(10,2) = 0;
    SELECT @total = ISNULL(SUM(S.ticketPrice * S.spectators), 0)
    FROM Show S
    WHERE S.movieTitle = @movieTitle;
    RETURN @total;
END;

SELECT dbo.TotalEarning('Black Panther') AS total_earning;

-- d --
CREATE FUNCTION RemainingSeats (@showId INT)
RETURNS INT
AS
BEGIN
    DECLARE @remaining INT = 0;
    SELECT @remaining = T.capacity - S.spectators
    FROM Show S
    JOIN Theater T ON S.theaterName = T.theaterName
    WHERE S.showId = @showId;
    RETURN ISNULL(@remaining, 0);
END;

SELECT dbo.RemainingSeats(5) AS remaining_seats;

-- Exercises 2 --
-- a --
CREATE VIEW MovieTheaterCount AS
SELECT M.title AS movie_title, M.year AS movie_year, M.DirectorName, COUNT(DISTINCT S.theaterName) AS num_theaters
FROM Movie M
JOIN Show S ON M.title = S.movieTitle
GROUP BY M.title, M.year, M.DirectorName;

SELECT * FROM MovieTheaterCount;

-- b --
CREATE VIEW TheaterMovieCount AS
SELECT T.theaterName, T.city, COUNT(DISTINCT S.movieTitle) AS num_movies
FROM Theater T
LEFT JOIN Show S ON T.theaterName = S.theaterName
GROUP BY T.theaterName, T.city;

SELECT * FROM TheaterMovieCount;

-- c --
CREATE FUNCTION MoviesByStar (@starName CHAR(25))
RETURNS INT
AS
BEGIN
    DECLARE @count INT = 0;
    SELECT @count = COUNT(DISTINCT SI.movieTitle)
    FROM StarsIn SI
    WHERE SI.starname = @starName;
    RETURN @count;
END;

SELECT dbo.MoviesByStar('Robert Downey') AS num_movies;

-- d --
CREATE FUNCTION TotalSpectators (@theaterName VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @total INT = 0;
    SELECT @total = ISNULL(SUM(S.spectators), 0)
    FROM Show S
    WHERE S.theaterName = @theaterName;
    RETURN @total;
END;

SELECT dbo.TotalSpectators('Grand Rex') AS total_spectators;
