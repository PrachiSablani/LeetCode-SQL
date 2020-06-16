/*
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
*/

SELECT MAX(Salary) as SecondHighestSalary
FROM Employee
WHERE Salary NOT IN (SELECT max(Salary)
FROM Employee)
