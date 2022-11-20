create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
	cID int auto_increment primary key,
    cName varchar(30),
    cAge int
);

create table `order`(
	oID int auto_increment primary key,
    cID int not null,
    oDate datetime,
    oTotalPrice int,
    foreign key (cID) references customer (cID)
);

create table product(
	pID int auto_increment primary key,
    pName varchar(30),
    pPrice int
);

create table order_detail(
	oID int,
    pID int,
    odQTY int,
    unique (oID, pID),
    foreign key (oID) references `order` (oID),
	foreign key (pID) references product (pID)
);

insert into customer(cName, cAge) values
	('Minh Quan', 10),
    ('Ngoc Oanh', 20),
    ('Hong Ha', 50);
    
insert into `order`(cID, oDate) values
	(1, '2006-3-21'),
    (2, '2006-3-23'),
    (1, '2006-3-16');
    
insert into product(pName, pPrice) values 
	('May Giat', 3),
	('Tu Lanh', 5),
	('Dieu Hoa', 7),
	('Quat', 1),
	('Bep Dien', 2);

insert into order_detail(oID, pID, odQTY) values 
	(1, 1, 3),
	(1, 3, 7),
	(1, 4, 2),
	(2, 1, 1),
	(3, 1, 8),
	(2, 5, 4),
	(2, 3, 3);    
    
select oID, oDate, oTotalPrice from `order`;


select c.cName, p.pName from 
customer c join `order` o on c.cID = o.cID join
order_detail od on o.oID = od.oID join
product p on od.pID=p.pID;

select c.cName from customer c
where c.cID not in (select cID from `order`);

select o.oID, o.oDate, sum(p.pPrice*od.odQTY) as oTotalPrice from `order` o
join order_detail od on o.oID = od.oID join
product p on od.pID=p.pID
group by o.oID;