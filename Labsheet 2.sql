
-- Exercise 1

-- a -- 

SELECT e.eid, e.ename, w.did
FROM emp e
INNER JOIN works w ON e.eid = w.eid
ORDER BY e.eid, w.did;

-- b --
SELECT d.did AS department_name, w.eid
FROM dept d
INNER JOIN works w ON d.did = w.did
ORDER BY d.did, w.eid;

-- c --
SELECT e.ename, d.did AS department_name
FROM emp e
INNER JOIN works w ON e.eid = w.eid
INNER JOIN dept d ON w.did = d.did
ORDER BY e.ename, d.did;

-- d --
SELECT e.ename, e.salary
FROM emp e
INNER JOIN works w ON e.eid = w.eid
INNER JOIN dept d ON w.did = d.did
WHERE d.budget > 1000000
ORDER BY e.ename;

-- e
SELECT DISTINCT d.did AS department_name
FROM dept d
INNER JOIN works w ON d.did = w.did
WHERE w.pct_time > 40
ORDER BY d.did;

-- Exercise 2 --


-- a --
SELECT did AS department_id, COUNT(DISTINCT eid) AS number_of_employees
FROM works
GROUP BY did
ORDER BY did;

-- b --
SELECT did AS department_name, COUNT(DISTINCT eid) AS number_of_employees
FROM works
GROUP BY did
ORDER BY did;

-- c --
SELECT did AS department_id
FROM works
GROUP BY did
HAVING COUNT(DISTINCT eid) > 2
ORDER BY did;

-- d --
SELECT did AS department_name, COUNT(DISTINCT eid) AS number_of_employees
FROM works
GROUP BY did
HAVING COUNT(DISTINCT eid) > 2
ORDER BY number_of_employees ASC, did;