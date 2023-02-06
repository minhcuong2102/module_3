create database thi_thuc_hanh_module3;
use thi_thuc_hanh_module3;
-- drop database thi_thuc_hanh_module3;

create table hinh_thuc_thanh_toan(
	ma_hinh_thuc int primary key,
    ten_hinh_thuc varchar(45)
);

create table phong_tro(
	id int primary key auto_increment,
    ma_phong_tro varchar(45),
    name varchar(45),
    so_dien_thoai varchar(45),
    ngay_thue date,
    hinh_thuc int,
    ghi_chu text,
    foreign key (hinh_thuc) references hinh_thuc_thanh_toan (ma_hinh_thuc)
);



insert into hinh_thuc_thanh_toan values
	(1, "Theo tháng"),
    (2, "Theo quý"),
    (3, "Theo năm");

insert into phong_tro values 
	(1, "PT-001", "Nguyễn Văn A", "0123456789", "2020-10-10", 1, "Phòng có điều hoà"),
    (2, "PT-002", "Nguyễn Văn B", "0123456789", "2020-10-10", 2, "..."),
    (3, "PT-003", "Nguyễn Văn C", "0123456789", "2020-10-10", 3, "Phòng có điều hoà"),
    (4, "PT-004", "Nguyễn Văn D", "0123456789", "2020-10-10", 1, "Phòng có điều hoà");
    
select p.*, ht.ten_hinh_thuc as ten_hinh_thuc from phong_tro p join hinh_thuc_thanh_toan ht on p.hinh_thuc = ht.ma_hinh_thuc;
select * from hinh_thuc_thanh_toan;
delete from phong_tro;

DELIMITER //
create procedure insert_pt(
	ma_pt varchar(45),
    name1 varchar(45),
    sdt varchar(45),
    ngaythue date,
    hinhthuc int,
    ghichu text
)
begin
	insert into phong_tro (ma_phong_tro, name, so_dien_thoai, ngay_thue, hinh_thuc, ghi_chu) 
    value (ma_pt, name1, sdt, ngaythue, hinhthuc, ghi_chu);
end //
DELIMITER ;

DELIMITER //
create procedure delete_pt(IN id1 int)
begin
	delete from phong_tro where id = id1;
end //
DELIMITER ;
