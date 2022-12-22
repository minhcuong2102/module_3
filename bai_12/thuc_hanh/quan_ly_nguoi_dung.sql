create database quan_ly_nguoi_dung;
use quan_ly_nguoi_dung;
-- drop database quan_ly_nguoi_dung;

create table users (
	id int(3) not null auto_increment,
	name varchar(120) not null,
	email varchar(220) not null,
	country varchar(120),
	primary key (id)
);

insert into users(name, email, country) values('Minh1','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante2','kante@che.uk','Kenia');

DELIMITER //
create procedure delete_user(IN user_id int)
begin
	delete from users where id = user_id;
end //
DELIMITER ;

call delete_user(2);
select * from users;