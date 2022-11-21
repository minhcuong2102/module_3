-- Bước 1: Tạo cơ sở dữ liệu demo
create database if not exists demo;
use demo;

-- Bước 2: Tạo bảng Products
create table products(
	id int auto_increment primary key,
    product_code varchar(20),
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description text,
    product_status bit
);

insert into products (id, product_code, product_name, product_price, product_amount, product_description, product_status) values
	(1, '123', 'Máy lạnh', 3200000, 10, 'máy lạnh siêu mát', 1),
    (2, '134', 'Quạt', 500000, 23, 'quạt siêu mát', 0),
    (3, '152', 'Lò vi sóng', 1500000, 8, 'lò vi sóng chất lượng cao', 1),
    (4, '183', 'Bếp điện', 800000, 5, 'bếp điện nấu nhanh', 0);

-- Bước 3    
create unique index idx_product_code on products(product_code);
explain select * from products where product_code = '134';

create index idx_product_name_code on products(product_name, product_code);
explain select * from products where product_name = 'Quạt' and product_code = '134';

-- Bước 4
create view view_product as
select product_code, product_name, product_price, product_status
from products;

select * from view_product;

create or replace view view_product as
select * from products
where product_name = 'Lò vi sóng';

drop view view_product;

-- Bước 5
DELIMITER //
create procedure getAllProduct()
begin
	select * from products;
end //
DELIMITER ;

call getAllProduct();

DELIMITER //
create procedure insertNewProduct(
	id int,
    product_code varchar(20),
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description text,
    product_status bit
)
begin
	insert into products values (id, product_code, product_name, product_price, product_amount, product_description, product_status);
end //
DELIMITER ;

call insertNewProduct(5, '200', 'Nồi', 120000, 50, 'nồi gang siêu bền', 1);

DELIMITER //
create procedure updateProduct(
	id1 int,
    product_code1 varchar(20),
    product_name1 varchar(50),
    product_price1 double,
    product_amount1 int,
    product_description1 text,
    product_status1 bit
)
begin
	update products
	set product_code = product_code1, product_name = product_name1, product_price = product_price1,
		product_amount = product_amount1, product_description = product_description1, product_status = product_status1
	where id = id1;
end //
DELIMITER ;

call updateProduct(3, '169', 'Lò vi sóng', 300000, 25, 'lò vi sóng chất lượng cao', 1);

DELIMITER //
create procedure deleteProduct(id1 int)
begin
	delete from products
	where id = id1;
end //
DELIMITER ;

call deleteProduct(2);
