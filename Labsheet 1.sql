
-- (a) --
SELECT * FROM emp;

-- (b) --
SELECT ename, salary FROM emp
WHERE salary > 50000;

-- (c) --
SELECT * FROM emp
WHERE ename LIKE 'A%';

-- (d) --
SELECT ename, age
FROM emp
WHERE age < 30;

-- (e) --
SELECT * FROM emp
WHERE salary BETWEEN 20000 AND 60000;

-- (f) --
SELECT ename
FROM emp
WHERE ename LIKE '%a%';

-- (g) --
SELECT eid, ename
FROM emp
WHERE age IN (24, 28);

-- (h) --
SELECT *
FROM emp
WHERE age NOT BETWEEN 25 AND 35;

-- (i) --
SELECT * FROM emp
WHERE salary IS NOT NULL;

-- Section 2: ORDER BY Clause

-- (a) --
SELECT * FROM emp
ORDER BY ename;

-- (b) --
SELECT * FROM emp
ORDER BY salary DESC;

-- (c) --
SELECT *  FROM emp
ORDER BY age ASC, salary DESC;

-- (d) --
SELECT * FROM dept
ORDER BY budget DESC;

-- (e) --
SELECT * FROM works
ORDER BY pct_time;

-- Section 3:-

-- (a) --
SELECT COUNT(*) FROM emp;

-- (b) --
SELECT SUM(salary)
FROM emp;

-- (c) --
SELECT MAX(salary), MIN(salary)
FROM emp;

-- (d) --
SELECT AVG(salary)
FROM emp;

-- (e) --
SELECT COUNT(*)
FROM emp
WHERE age < 30;

-- (f) --
SELECT COUNT(*)
FROM dept;

-- (g) --
SELECT MAX(budget), MIN(budget)
FROM dept;

-- (h) --
SELECT SUM(pct_time)
FROM works;

-- (i) --
SELECT AVG(avg_pct)
FROM (
    SELECT AVG(pct_time) AS avg_pct
    FROM works
    GROUP BY eid
) AS sub;

-- Section 4:- 

-- (a) --
SELECT age, SUM(salary)
FROM emp
GROUP BY age;

-- (b) --
SELECT did, COUNT(DISTINCT eid) AS "Number of Employees"
FROM works
GROUP BY did;

-- (c) --
SELECT COUNT(*) FROM emp
WHERE salary > 50000;

-- (d) --
SELECT * FROM emp
WHERE salary > 50000
ORDER BY salary ASC;

-- Section 5:- 

-- (a) --
SELECT did AS department_id
FROM works
GROUP BY did
HAVING COUNT(DISTINCT eid) < 3;

-- (b) --
SELECT managerId AS manager_id, COUNT(*) AS num_departments
FROM dept
GROUP BY managerId
HAVING COUNT(*) > 1
ORDER BY num_departments ASC;

-- (c) --
SELECT age AS age_group, AVG(salary) AS avg_salary
FROM emp
GROUP BY age
HAVING AVG(salary) > 40000;

-- (d) -- 
SELECT eid AS employee_id, COUNT(*) AS num_assignments
FROM works
GROUP BY eid
HAVING COUNT(*) > 2;

-- (e) --
SELECT did AS department_id, budget
FROM dept
WHERE budget > 1000000;