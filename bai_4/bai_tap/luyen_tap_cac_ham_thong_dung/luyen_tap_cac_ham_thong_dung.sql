use quan_ly_sinh_vien_1;

select * from subject 
where credit = (select max(credit) from subject);

select s.* from subject s join mark m on s.sub_id = m.sub_id 
where m.mark = (select max(mark) from mark);

select *, avg(mark) as 'diem_trung_binh' from student s 
join mark m on s.student_id = m.student_id
group by m.student_id
order by m.mark desc;
