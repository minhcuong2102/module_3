use furama_resort;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as
select nv.* from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where hd.ngay_lam_hop_dong = '2020-12-08'
and nv.dia_chi like '%Gia Lai';

drop view v_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update v_nhan_vien set dia_chi = 'Liên Chiểu';

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào
-- như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
create procedure sp_xoa_khach_hang(in id int)
begin
	delete from khach_hang where ma_khach_hang = id;
end //
DELIMITER ;
drop procedure sp_xoa_khach_hang;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER //
create procedure sp_them_moi_hop_dong(in 
    contract_date datetime,
    end_date datetime, 
	deposit_money double, 
	employee_id int, 
	customer_id int, 
	service_id int)
begin
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) 
    values (contract_date, end_date, deposit_money,
    if(employee_id not in (select ma_nhan_vien from nhan_vien), (select 'Không tìm thấy' as 'error'), employee_id), 
	if(customer_id not in (select ma_khach_hang from khach_hang), (select 'Không tìm thấy' as 'error'), customer_id), 
	if(service_id not in (select ma_dich_vu from dich_vu), (select 'Không tìm thấy' as 'error'), service_id));
end //
DELIMITER ;
drop procedure sp_them_moi_hop_dong;

call sp_them_moi_hop_dong('2021-02-21', '2021-02-22', 500000, 3, 10, 5);

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại
-- có trong bảng hop_dong ra giao diện console của database.
create table log(
	id int auto_increment primary key, 
	table_action varchar(45), 
	action varchar(45),
	message varchar(200),
	time datetime);
    
delimiter //
create trigger tr_xoa_hop_dong
after delete on hop_dong
for each row
begin
	insert into log(table_action, action, message, time)
value ('contract', 'delete', 'contract table have '+ (select count(contract_id) from contract) + ' records after delete', now());
end //
delimiter ;

drop table log;
drop trigger tr_xoa_hop_dong;

