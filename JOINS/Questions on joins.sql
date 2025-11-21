-- topic:20 SQL JOIN Practice Questions on joins 
-- 1)Display student names and course names using INNER JOIN
select students.name,courses.course_name
from students inner join courses
on students.id=courses.Student_id;

-- 2)Display all students and their courses using LEFT JOIN
select s.name,c.course_name
from students s left join courses c
on s.id=c.Student_id;

-- 3)Display all courses and the corresponding students using RIGHT JOIN
select s.name,c.course_name
from students s right join courses c
on s.id=c.Student_id;

-- 4)Display all students and courses using FULL JOIN (if DB supports it)
select s.name,c.course_name
from students s left join courses c
on s.id=c.Student_id
union
select s.name,c.course_name
from students s right join courses c
on s.id=c.Student_id;

-- 5)Display students who do NOT have any course assigned
select s.id , s.name from students s
left join courses c on s.id=c.student_id
where c.student_id is null;

-- 6)Display courses which do NOT have a matching student
select s.id , s.name from students s
right join courses c on s.id=c.student_id
where s.id is null;

 -- 7)Display student names and fee amount using INNER JOIN
select s.name ,f.amount 
from students s inner join fees f
on s.id=f.student_id;

-- 8)Display all students and their fee details using LEFT JOIN
select s.name ,f.amount 
from students s left join fees f
on s.id=f.student_id;

-- 9)Display fee records with student names using RIGHT JOIN
select s.name ,f.amount 
from students s right join fees f
on s.id=f.student_id;

-- 10)Display students who haven’t paid fees (fees record missing)
select s.name ,f.amount 
from students s left join fees f
on s.id=f.student_id where f.amount is null;

-- 11)Display students who paid the fees
select s.name ,f.amount 
from students s left join fees f
on s.id=f.student_id where f.amount is not null;

-- 12)Display students who have a course enrolled but fee not paid
select s.name,c.course_name ,f.amount from students s
 inner join courses c on s.id=c.student_id
 left join fees f on s.id=f.student_id where f.status ='pending';
 
 -- 13)Display number of courses taken by each student
 select s.name,count(c.course_name) as total_courses from students s
 left join courses c on s.id=c.student_id group by s.id;
 
 -- 14) Display students with multiple courses
 select s.name,count(c.course_name) as total_courses from students s 
 left join courses c on s.id=c.student_id group by s.id having count(c.course_name)>1;
 
 -- 15)Display total fee amount collected grouped by city (JOIN + GROUP BY)
 select s.city,sum(f.amount) as total_fee_collected
from students s left join fees f 
on s.id=f.student_id group by s.city;

-- 16)Display city-wise number of students who joined Java course
select s.city,c.course_name,count(s.id)
from students s inner join courses c
on s.id=c.student_id where c.course_name='java' group by s.city  ;

-- 17)Display all combinations of students and courses using CROSS JOIN 
select s.name,c.course_name from students s 
cross join courses c;

-- 18)Display students and their courses sorted by student name
select s.name,c.course_name
from students s inner join courses c
on s.id=c.Student_id order by s.name  ;

-- 19)Display students and their courses sorted by course name
select s.name,c.course_name
from students s inner join courses c
on s.id=c.Student_id order by c.course_name  ;

-- 20)Display students who have both course and fee records (INTERSECTION type)
select s.name,c.course_name ,f.amount
from students s inner join courses c
on s.id=c.Student_id  inner join fees f
on s.id=f.student_id;

