create database furama;
use furama;
-- drop database furama;

create table `position`(
	id int primary key auto_increment,
    name varchar(45)
);

create table education_degree(
	id int primary key auto_increment,
	name varchar(45)
);

create table division(
	id int primary key auto_increment,
	name varchar(45)
);

create table customer_type(
	id int primary key auto_increment,
	name varchar(45)
);

create table facility_type(
	id int primary key auto_increment,
	name varchar(45)
);

create table rent_type(
	id int primary key auto_increment,
	name varchar(45)
);

create table `role`(
	role_id int primary key auto_increment,
	role_name varchar(255)
);

create table `user`(
	username varchar(255) primary key,
	`password` varchar(255)
);

create table user_role(
	role_id int auto_increment,
	username varchar(255),
	primary key(role_id, username),
	foreign key(role_id) references `role`(role_id),
	foreign key(username) references `user`(username)
);

create table attach_facility(
	id int primary key auto_increment,
	`name` varchar(45),
	cost double,
	unit varchar(10),
	`status` varchar(45)
);

create table employee(
	id int primary key auto_increment,
    name varchar(45),
    date_of_birth date,
    id_card varchar(45),
    salary double,
    phone_number varchar(45),
    email varchar(45),
    address varchar(45),
    position_id int,
    education_degree_id int,
    division_id int,
    username varchar(255),
    foreign key(position_id) references `position`(id),
    foreign key(education_degree_id) references education_degree(id),
	foreign key(division_id) references division(id),
	foreign key(username) references `user`(username)
);

create table customer(
	id int primary key auto_increment,
    customer_type_id int,
    name varchar(45),
    date_of_birth date,
    gender bit(1),
    id_card varchar(45),
    phone_number varchar(45),
    email varchar(45),
	address varchar(45),
    foreign key(customer_type_id) references customer_type(id)
);

create table facility(
	id int primary key auto_increment,
    name varchar(45),
    area int,
    cost double,
    max_people int,
    rent_type_id int,
    facility_type_id int,
    standard_room varchar(45),
    description_other_convenience varchar(45),
    pool_area double,
    number_of_floors int,
    facility_free text,
    foreign key(rent_type_id) references rent_type(id),
    foreign key(facility_type_id) references facility(id)
);

create table contract(
	id int primary key auto_increment,
    start_date datetime,
    enđ_date datetime,
    employee_id int,
	customer_id int,
    facility_id int,
    foreign key(employee_id) references employee(id),
    foreign key(customer_id) references customer(id),
    foreign key(facility_id) references facility(id)
);

create table contract_detail(
	id int primary key auto_increment,
    contract_id int,
    attach_facility_id int,
    quantity int,
    foreign key(contract_id) references contract(id),
    foreign key(attach_facility_id) references attach_facility(id)
);

    
DELIMITER //
create procedure insert_customer(
	customer_type_id1 int, 
	name1 varchar(45), 
	date_of_birth1 date, 
	gender1 bit(1), 
	id_card1 varchar(45), 
	phone_number1 varchar(45), 
	email1 varchar(45), 
	address1 varchar(45)
)
begin
	insert into customer (customer_type_id, name, date_of_birth, gender, id_card, phone_number, email, address) 
    values (customer_type_id1, name1, date_of_birth1, gender1, id_card1, phone_number1, email1, address1);
end //
DELIMITER ;

-- drop procedure insert_customer;
insert into customer_type values
	(1, 'Diamond'),
    (2, 'Platinum'),
    (3, 'Gold'),
    (4, 'Silver'),
    (5, 'Member');
    
call insert_customer(5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng');
select c.*, ct.name as ct_name from customer c join customer_type ct on c.customer_type_id = ct.id;
select * from customer_type;

DELIMITER //
create procedure delete_customer(IN customer_id int)
begin
	delete from customer where id = customer_id;
end //
DELIMITER ;

insert into rent_type values
	(1, 'Năm'),
    (2, 'Tháng'),
    (3, 'Ngày'),
    (4, 'Giờ');
    
insert into facility_type values
	(1, 'Villa'),
    (2, 'House'),
    (3, 'Room');
    
insert into facility values
	(1, "Villa Beach Front", 25000, 1000000, 10, 3, 1, "vip", "Có hồ bơi", 500, 4, null),
	(2, "House Princess 01", 14000, 5000000, 7, 2, 2, "vip", "Có thêm bếp nướng", null, 3, null),
	(3, "Room Twin 01", 5000, 1000000, 2, 4, 3, "normal", "Có tivi", null, null, "1 Xe máy, 1 Xe đạp"),
	(4, "Villa No Beach Front", 22000, 9000000, 8, 3, 1, "normal", "Có hồ bơi", 300, 3, null),
	(5, "House Princess 02", 10000, 4000000, 5, 3, 2, "normal", "Có thêm bếp nướng", null, 2, null),
	(6, "Room Twin 02", 3000, 900000, 2, 4, 3, "normal", "Có tivi", null, null, "1 Xe máy");
    
