/*
Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key for this table.
Each row of this table contains the ID and the name of one student in the school.
 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key for this table.
Each row of this table contains the name of one subject in the school.
*/

SELECT a.student_id, a.student_name, b.subject_name, IFNULL(COUNT(e.subject_name), 0) AS attended_exams
FROM Students a JOIN Subjects b
LEFT JOIN Examinations e
ON e.student_id = a.student_id AND e.subject_name = b.subject_name
GROUP BY a.student_id, b.subject_name
ORDER BY a.student_id
