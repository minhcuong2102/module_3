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
    
DELIMITER //
create trigger tr_xoa_hop_dong
after delete on hop_dong
for each row
begin
	insert into log(table_action, action, message, time)
	value ('hop_dong', 'delete', 'contract table have '+ (select count(contract_id) from contract) + ' records after delete', now());
end //
DELIMITER ;

drop table log;
drop trigger tr_xoa_hop_dong;

-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật,
-- nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
DELIMITER //
create trigger tr_cap_nhat_hop_dong
before update on hop_dong
for each row
begin
	if datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong) < 2 then
    insert into log(table_action, action, message, time)
    value ('hop_dong', 'update', 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày', now());
    update hop_dong set ngay_ket_thuc = old.ngay_ket_thuc where ma_hop_dong = old.ma_hop_dong;
    end if;
end //
DELIMITER ;

drop trigger tr_cap_nhat_hop_dong;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
DELIMITER //
create function func_dem_dich_vu()
returns int
deterministic
begin
	declare result int;
    set result = (select count(*) from dich_vu_di_kem dvdk
				  join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
				  where hdct.count * dvdk.gia > 2000000);
	return result;
end //
DELIMITER ;

drop function func_dem_dich_vu;
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc
-- kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ,
-- không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.
DELIMITER //
create function func_tinh_thoi_gian_hop_dong(ma_so int)
returns int
deterministic
begin
	declare result int;
		if ma_so in (select ma_khach_hang from khach_hang) then
        set result = (select max(datediff(hd.ngay_ket_thuc, hd.ngay_lam_hop_dong)) from hop_dong hd
					  join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
					  where kh.ma_khach_hang = ma_so
					  group by kh.ma_khach_hang);
        end if;
	return result;
end //
DELIMITER ;

drop function func_tinh_thoi_gian_hop_dong;

-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room”
-- từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa
-- những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.
DELIMITER //
create procedure sp_xoa_dich_vu_va_hd_room()
begin
	delete from hop_dong
    where ma_dich_vu in (select ma_dich_vu from dich_vu
						 where ma_loai_dich_vu = 3)
                         and (year(ngay_ket_thuc) between 2015 and 2019);
	delete from dich_vu where ma_loai_dich_vu = 3;
end //
DELIMITER ;

drop procedure sp_xoa_dich_vu_va_hd_room;