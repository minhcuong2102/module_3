use quan_ly_sinh_vien_1;

select * from subject where credit < 10;

select s.student_id, s.student_name, c.class_name
from student s join class c on s.class_id = c.class_id
where c.class_name = 'A1';

select S.student_id, S.student_name, Sub.sub_name, M.Mark
from student S join mark M on S.student_id = M.student_id join Subject Sub on M.sub_id = Sub.sub_id
where Sub.sub_name = 'CF';
