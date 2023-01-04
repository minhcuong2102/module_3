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

DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    where users.id = user_id;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$
DELIMITER ;

create table Permision(
id int(11) primary key,
name varchar(50)
);

create table User_Permision(
permision_id int(11),
user_id int(11)
);

insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');

DELIMITER //
create procedure select_user_list()
begin
	select * from users order by name;
end //
DELIMITER ;