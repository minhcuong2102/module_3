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
