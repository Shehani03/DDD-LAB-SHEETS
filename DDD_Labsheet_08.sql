--Exercise 1
--c
select did,budget from dept
where budget > (
select AVG(salary) from emp )

--d
select ename,salary from emp
where salary <> (
select AVG(salary) from emp )

--e
select ename,salary from emp
where salary < (
select e.salary from emp e, dept d
where d.managerId = e.eid and d.did ='ITSD' )

--Exercise 2
--c
select ename,salary from emp
where salary > all ( 
select e.salary from emp e, works w
where e.eid = w.eid and w.did='Admin' )

--d
select ename,salary from emp
where salary > any ( 
select e.salary from emp e, works w
where e.eid = w.eid and w.did='Finance' )

--e
select d.did from dept d
where 30000 < all (
select e.salary from works w,emp e
where w.eid = e.eid and d.did = w.did )
